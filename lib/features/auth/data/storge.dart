import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class Storage {
  final _instance = Supabase.instance;
  Future<String?> getUrlImage({required String id}) async {
    try {
      if (id.isEmpty) {
        return null;
      }
      final url = _instance.client.storage
          .from('avatars')
          .getPublicUrl(id);
      return url.isNotEmpty ? url : null;
    } catch (e) {
      return null;
    }
  }

  Future<void> uploadAvatar({required String id, required File image}) async {
    await _instance.client.storage.from('avatars').upload(id,image);
  }
  Future<bool> existsImage({required String id})async{
   return await _instance.client.storage.from('avatars').exists(id);
  }
  Future <void> deleterAvatar({required String id })async{
    await _instance.client.storage.from('avatars').remove([id]);
  }
  Future<void> updateAvatar({required String id, required File image}) async {
    await _instance.client.storage.from('avatars').update(id,image);
  }
}