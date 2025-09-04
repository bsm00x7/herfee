import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../service/model/job_model.dart';
import '../../../service/model/user_model.dart';

class SupaBaseData {
  final _instance = Supabase.instance.client;

  Future<UserModel> user() async {
    final currentLoginUser = Supabase.instance.client.auth.currentUser!.id;
    final response = await _instance
        .from('users')
        .select()
        .eq('id', currentLoginUser)
        .single();
    return UserModel.fromMap(response);
  }

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

  Future<void> insertJob({
    required String userId,
    required JobModel job,
  }) async {
    await _instance.from('pastWork').insert({
      'user_id': userId,
      'job_title': job.title,
      'description': job.description,
      'imageJob': job.imageSource,
    });
  }

  Future<void> deleterUser({required String id}) async {
    await _instance.auth.admin.deleteUser(id);
  }
}
