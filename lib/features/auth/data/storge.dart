import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';

class Storage {
  final _instance = Supabase.instance;
  Future<String?> getUrlImage({required String id}) async {
    try {
      if (id.isEmpty) {
        return null;
      }

      // Get the public URL
      final url = _instance.client.storage
          .from('avatars')
          .getPublicUrl(id);

      // Validate that the URL is not empty
      return url.isNotEmpty ? url : null;
    } catch (e) {
      print('Error getting image URL for id $id: $e');
      return null;
    }
  }

  /// Upload an avatar image to Supabase storage
  Future<String?> uploadAvatar({
    required Uint8List fileBytes,
    required String? userId,
  }) async {
    try {
      // Create a unique file name if userId is provided
      final uniqueFileName = '${userId}.jpg';

      await _instance.client.storage
          .from('avatars')
          .uploadBinary(uniqueFileName, fileBytes);

      // Return the file name for future reference
      return uniqueFileName;
    } catch (e) {
      return null;
    }
  }

  /// Delete an avatar image from Supabase storage
  Future<bool> deleteAvatar({required String fileName}) async {
    try {
      await _instance.client.storage
          .from('avatars')
          .remove([fileName]);
      return true;
    } catch (e) {
      print('Error deleting avatar: $e');
      return false;
    }
  }

  /// Update an avatar (delete old one and upload new one)
  Future<String?> updateAvatar({
    required String userId,
    required String newFileName,
    required Uint8List fileBytes,
  }) async {
    try {
      await deleteAvatar(fileName: userId);
      return await uploadAvatar(
        fileBytes: fileBytes,
        userId: userId,
      );
    } catch (e) {
      print('Error updating avatar: $e');
      return null;
    }
  }

  /// Check if a file exists in the avatars bucket
  Future<bool> fileExists({required String fileName}) async {
    try {
      final response = await _instance.client.storage
          .from('avatars')
          .list(path: fileName);
      return response.isNotEmpty;
    } catch (e) {
      print('Error checking file existence: $e');
      return false;
    }
  }
}