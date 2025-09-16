import 'package:flutter/cupertino.dart';
import 'package:herfee/features/auth/data/storge.dart';
import 'package:herfee/service/model/message_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/utils/error/error.dart';
import '../../../service/model/job_model.dart';
import '../../../service/model/user_model.dart';

class SupaBaseData {
  final _instance = Supabase.instance.client;

  String get currentLoginUser => Supabase.instance.client.auth.currentUser!.id;

  /// get user data [user name , image profile , about ..]

  Future<UserModel> user([String id = '']) async {
    final currentLoginUser = Supabase.instance.client.auth.currentUser!.id;
    final response = await _instance
        .from('users')
        .select()
        .eq('id', id.isEmpty ? currentLoginUser : id)
        .single();
    var userData = UserModel.fromMap(response);
    if (userData.imageId.isEmpty) {
      String? imageUrl;
      imageUrl = await Storage().getUrlImage(id: userData.id, table: 'avatars');
      if (imageUrl != null) {
        SupaBaseData().updateUser(
          id: id.isEmpty ? currentLoginUser : id,
          image: imageUrl,
        );
      }
      userData = userData.copyWith(imageId: imageUrl);
    }

    // Fetch additional user data in parallel for better performance
    final results = await Future.wait([
      SupaBaseData().getExperience(userId: id.isEmpty ? currentLoginUser : id),
      SupaBaseData().getJob(userId: id.isEmpty ? currentLoginUser : id),
    ]);
    final List<Experience> listOfExperience = results[0] as List<Experience>;
    final List<JobModel> listOfJob = results[1] as List<JobModel>;

    // Update userData with experience and jobs if available
    if (listOfExperience.isNotEmpty) {
      userData = userData.copyWith(experience: listOfExperience);
    }

    if (listOfJob.isNotEmpty) {
      userData = userData.copyWith(pastWork: listOfJob);
    }
    return userData;
  }

  /// add New user to database
  Future<AuthResponse> insertToDataBase({
    required Map<String, dynamic> user,
  }) async {
    return await _instance.from('users').insert({
      'id': user['id'],
      'imageId': user['imageId'],
      'userName': user['userName'],
      'jobe': user['jobe'],
      'rating': user["rating"],
      'reviews': user['reviews'],
      'about': user['about'],
      'isActive': user['isActive'],
      'verifer_account': user['verifer_account'],
      "role": user["role"],
    });
  }

  /// Get user job posts
  Future<List<JobModel>> getUserJobPosts({String userId = ''}) async {
    final targetUserId = userId.isEmpty ? currentLoginUser : userId;
    final response = await _instance
        .from('job_posts')
        .select()
        .eq('user_id', targetUserId)
        .eq('is_active', true)
        .order('created_at', ascending: false);

    return response
        .map(
          (e) => JobModel.fromMap({
            "title": e["job_title"],
            "description": e["description"],
            "imageJob": e["imageJob"],
            "id": e["id"],
            "user_id": e["user_id"],
            "created_at": e["created_at"],
            "is_active": e["is_active"],
          }),
        )
        .toList();
  }

  /// insert experience to database [using  user id ]
  Future<AuthResponse> insertExperience({
    required String userId,
    required Experience experience,
  }) async {
    return await _instance.from('experiences').insert({
      'user_id': userId,
      'title': experience.title,
      'periode': experience.periode,
    });
  }

  /// Insert user job [using user is ]
  Future<void> insertJobPost({required JobModel job}) async {
    final jobData = {
      'id': job.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      'user_id': currentLoginUser,
      'job_title': job.job_title,
      'description': job.description,
      'imageJob': job.imageJob,
      'created_at': DateTime.now().toIso8601String(),
      'is_active': true,
    };

    await _instance.from('job_posts').insert(jobData);
  }

  /// deleter  user from data base
  Future<void> deleterUser({
    required String id,
    required BuildContext context,
  }) async {
    await _instance.auth.admin
        .deleteUser(id)
        .onError(
          (error, stackTrace) =>
              CustomErrorWidget.showError(context, "Try In Anthor time "),
        );
    await _instance.from('users').delete().eq('id', id);
    await _instance.from('experiences').delete().eq('user_id', id);
    await _instance.from('job_posts').delete().eq('user_id', id);
    await _instance.from('messages').delete().eq('sendId', id);
    await _instance.from('messages').delete().eq('recvId', id);
  }

  /// update user information
  Future<void> updateUser({required String id, required String image}) async {
    await _instance.from('users').update({"imageId": image}).eq('id', id);
  }

  Future<void> updateUserStatus({required bool value}) async {
    await _instance
        .from('users')
        .update({"isActive": value})
        .eq('id', currentLoginUser);
  }

  /// Get user experience from data base <<<<[using user id ]>>>>>>>>
  Future<List<Experience>> getExperience({required String userId}) async {
    final response = await _instance
        .from('experiences')
        .select()
        .eq('user_id', userId);
    return response.map((e) => Experience.fromMap(e)).toList();
  }

  /// Get user job from data base <<<<[using user id ]>>>>>>>>
  Future<List<JobModel>> getJob({required String userId}) async {
    final response = await _instance
        .from('job_posts')
        .select()
        .eq('user_id', userId);
    return response.map((e) {
      return JobModel.fromMap({
        "title": e["job_title"],
        "description": e["description"],
        "imageJob": e["imageJob"],
      });
    }).toList();
  }

  Future<List<UserModel>> listUsers() async {
    final response = await _instance
        .from('users')
        .select()
        .neq('id', Supabase.instance.client.auth.currentUser!.id)
        .order('reviews', ascending: false)
        .range(0, 10);
    return response.map((e) => UserModel.fromMap(e)).toList();
  }

  Future<void> sendMessage({required Map<String, dynamic> message}) async {
    await _instance.from('messages').insert(message);
  }

  // Stream messages for real-time updates
  Stream<List<MessageModel>> messageStream({
    required String currentUserId,
    required String otherUserId,
  }) {
    final response = _instance
        .from('messages')
        .stream(primaryKey: ['id'])
        .inFilter('sendId', [currentUserId, otherUserId])
        .order('createdAt', ascending: false)
        .map(
          (data) => data
              .where(
                (json) =>
                    (json['sendId'] == currentUserId &&
                        json['recvId'] == otherUserId) ||
                    (json['sendId'] == otherUserId &&
                        json['recvId'] == currentUserId),
              )
              .map((json) => MessageModel.fromMap(json))
              .toList(),
        );
    return response;
  }

  Future<void> sign_out() async {
    await _instance.auth.signOut();
  }

  Future<List<String>> listOfJob() async {
    final response = await _instance
        .from('job_posts')
        .select("job_title")
        .range(0, 4);
    return response.map((e) => e["job_title"] as String).toList();
  }

  /// Get all job posts
  Future<List<JobModel>> getAllJobPosts() async {
    final response = await _instance
        .from('job_posts')
        .select()
        .eq('is_active', true)
        .order('created_at', ascending: false);

    return response
        .map(
          (e) => JobModel.fromMap({
            "title": e["job_title"],
            "description": e["description"],
            "imageJob": e["imageJob"],
            "id": e["id"],
            "user_id": e["user_id"],
            "created_at": e["created_at"],
            "is_active": e["is_active"],
          }),
        )
        .toList();
  }

  /// Update job post
  Future<void> updateJobPost({
    required String jobId,
    required JobModel job,
  }) async {
    await _instance
        .from('job_posts')
        .update({
          'job_title': job.job_title,
          'description': job.description,
          'imageJob': job.imageJob,
        })
        .eq('id', jobId);
  }

  /// Delete job post
  Future<void> deleteJobPost({required String jobId}) async {
    await _instance.from('job_posts').delete().eq('id', jobId);
  }

  Future<List<UserModel>> listOfUserFindWithJob({required String job}) async {
    final listOfUserWithJobeTileFind = await _instance
        .from("job_posts")
        .select("user_id")
        .eq("job_title", job.trim().toLowerCase());
    if (listOfUserWithJobeTileFind.isEmpty) return [];
    final List<String> userIds = listOfUserWithJobeTileFind
        .map((r) => r['user_id'] as String)
        .toSet()
        .toList();
    if (userIds.isEmpty) return [];
    final response = await _instance
        .from('users')
        .select()
        .inFilter('id', userIds);
    return response.map((e) => UserModel.fromMap(e)).toList();
  }

  Future<String?> jobId({required JobModel job}) async {
    final response = await _instance
        .from("job_posts")
        .select()
        .eq("user_id", currentLoginUser)
        .eq("job_title", job.job_title)
        .eq("description", job.description);

    return response.map((e) => JobModel.fromMap(e)).toList()[0].id;
  }
}
