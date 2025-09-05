import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../service/model/job_model.dart';
import '../../../service/model/user_model.dart';

class SupaBaseData {
  final _instance = Supabase.instance.client;

  /// get user data [user name , image profile , about ..]
  Future<UserModel> user() async {
    final currentLoginUser = Supabase.instance.client.auth.currentUser!.id;
    final response = await _instance
        .from('users')
        .select()
        .eq('id', currentLoginUser)
        .single();
    return UserModel.fromMap(response);
  }

  /// add New user to database
  Future<AuthResponse> insertToDataBase({
    required Map<String, dynamic> user,
  }) async {
    return await _instance.from('users').insert({
      'id': user['id'],
      'image_id': user['imageId'],
      'userName': user['userName'],
      'jobe': user['jobe'],
      'rating': user["rating"],
      'reviews': user['reviwes'],
      'about': user['about'],
    });
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
  Future<void> insertJob({
    required String userId,
    required JobModel job,
  }) async {
    await _instance.from('pastWork').insert({
      'user_id': userId,
      'job_title': job.jobTitle,
      'description': job.description,
      'imageJob': job.imageJob,
    });
  }

  /// deleter  user from data base
  Future<void> deleterUser({required String id}) async {
    await _instance.auth.admin.deleteUser(id);
    await _instance.from('pastWork').delete().eq('id', id);
    await _instance.from('experiences').delete().eq('id', id);
  }

  /// update user information
  Future<void> updateUser({required String id, required String image }) async {
    await _instance.from('users').update({"image_id": image}).eq('id', id);
  }


  /// Get user experience from data base <<<<[using user id ]>>>>>>>>
  Future <List<Experience>> getExperience({required String userId}) async {
    final response = await _instance.from('experiences').select().eq(
        'user_id', userId);
    return response.map((e) => Experience.fromMap(e)).toList();
  }

  /// Get user job from data base <<<<[using user id ]>>>>>>>>
  Future<List<JobModel>> getJob({required String userId}) async {
    final response = await _instance.from('pastWork').select().eq(
        'user_id', userId);
    return response.map(
            (e) {
          return JobModel.fromMap({
            "title": e["job_title"],
            "description": e["description"],
            "imageJob": e["imageJob"]
            });
          }
          ).toList();
        }
        }
