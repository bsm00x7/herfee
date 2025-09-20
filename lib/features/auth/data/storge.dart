import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class Storage {
  final _instance = Supabase.instance;
  Future<String?> getUrlImage({
    required String id,
    required String table,
  }) async {
    try {
      if (id.isEmpty) {
        return null;
      }
      final url = _instance.client.storage.from(table).getPublicUrl(id);
      return url.isNotEmpty ? url : null;
    } catch (e) {
      return null;
    }
  }

  Future<void> uploadAvatar({
    required String id,
    required File image,
    required String table,
  }) async {
    if (await existsImage(id: id, table: table) == true) {
      await deleterAvatar(id: id);
    }
    await _instance.client.storage.from(table).upload(id, image);
  }

  Future<bool> existsImage({required String id, required String table}) async {
    return await _instance.client.storage.from(table).exists(id);
  }

  Future<void> deleterAvatar({required String id}) async {
    await _instance.client.storage.from('avatars').remove([id]);
  }

  Future<void> updateAvatar({
    required String id,
    required File image,
    required String table,
  }) async {
    await _instance.client.storage.from(table).update(id, image);
  }
  // Add these methods to your Storage class

  Future<String?> uploadJobImage({
    required String jobId,
    required File image,
  }) async {
    try {
      final fileName = 'job_$jobId';
      await _instance.client.storage.from('job_images').upload(fileName, image);
      return _instance.client.storage.from('job_images').getPublicUrl(fileName);
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteJobImage({required String jobId}) async {
    try {
      final fileName = 'job_$jobId';
      await _instance.client.storage.from('job_images').remove([fileName]);
    } catch (e) {
      print('Error deleting job image: $e');
    }
  }

  Future<void> updateJobImage({
    required String jobId,
    required File image,
  }) async {
    try {
      final fileName = 'job_$jobId';
      await _instance.client.storage.from('job_images').update(fileName, image);
    } catch (e) {
      print('Error updating job image: $e');
    }
  }
}
