import 'dart:io';

import 'package:flutter/material.dart';
import 'package:herfee/core/utils/error/error.dart';
import 'package:herfee/features/auth/domain/auth.dart';
import 'package:herfee/service/model/job_model.dart';
import 'package:herfee/service/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../generated/l10n.dart';
import '../../../auth/data/data.dart';
import '../../../auth/data/storge.dart';
import '../../../../core/utils/picker_image_gallery_camera/picker.dart';

class ProfileController with ChangeNotifier {
  final s = S.current;

  // Loading states
  bool _isLoading = false;
  bool _isImageUploading = false;
  bool _isDeletingJob = false;

  // Data states
  UserModel? _userData;
  bool _hasImage = false;
  String? _imageUrl;

  // Error state
  String? _error;

  // Getters
  bool get isLoading => _isLoading;
  bool get isImageUploading => _isImageUploading;
  bool get isDeletingJob => _isDeletingJob;
  bool get hasImage => _hasImage;
  UserModel? get userData => _userData;
  String? get imageUrl => _imageUrl;
  String? get error => _error;
  bool get hasData => _userData != null;

  final userId = AuthNotifier().user!.id;
  final picker = PickerImageClasse();

  // Initialize and load user data
  Future<void> initialize() async {
    await loadUserData();
    await checkImageExists();
  }

  // Load user data
  Future<void> loadUserData() async {
    try {
      setError(null);
      setLoading(true);

      final response = await SupaBaseData().user();
      _userData = response;

      // Check if user has image ID (this might be the user ID or a URL)
      if (response.imageId.isNotEmpty) {
        // If imageId looks like a URL (contains http), use it directly
        if (response.imageId.startsWith('http')) {
          _imageUrl = response.imageId;
          _hasImage = true;
        } else {
          // Otherwise, get URL from storage using the imageId
          final storage = Storage();
          final imageUrl = await storage.getUrlImage(
            id: response.imageId,
            table: 'avatars',
          );
          _imageUrl = imageUrl;
          _hasImage = imageUrl != null;
        }
      } else {
        _imageUrl = null;
        _hasImage = false;
      }

      setLoading(false);
    } catch (e) {
      setError('Failed to load profile data: $e');
      setLoading(false);
    }
  }

  // Refresh user data
  Future<void> refreshUserData() async {
    await loadUserData();
    await checkImageExists();
  }

  // Check if user has an avatar image
  Future<void> checkImageExists() async {
    try {
      final storage = Storage();
      final response = await storage.existsImage(id: userId, table: 'avatars');
      _hasImage = response;

      if (response) {
        // Get the image URL if it exists
        final imageUrl = await storage.getUrlImage(
          id: userId,
          table: 'avatars',
        );
        _imageUrl = imageUrl;
      } else {
        _imageUrl = null;
      }

      notifyListeners();
    } catch (e) {
      debugPrint('Error checking image existence: $e');
      // Don't set error for this, it's not critical
    }
  }

  // Set loading state
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Set image uploading state
  void setImageUploading(bool value) {
    _isImageUploading = value;
    notifyListeners();
  }

  // Set job deleting state
  void setDeletingJob(bool value) {
    _isDeletingJob = value;
    notifyListeners();
  }

  // Set error state
  void setError(String? error) {
    _error = error;
    notifyListeners();
  }

  // Update image URL and state with cache busting
  void _updateImageState(String? newImageUrl) {
    if (newImageUrl != null) {
      // Add timestamp to prevent caching issues
      final cacheBustUrl =
          '$newImageUrl?t=${DateTime.now().millisecondsSinceEpoch}';
      _imageUrl = cacheBustUrl;
      _hasImage = true;

      // Update user data if available
      if (_userData != null) {
        _userData = _userData!.copyWith(imageId: cacheBustUrl);
      }
    }
    notifyListeners();
  }

  // Pick image from camera
  Future<void> pickerFromCamera(BuildContext context) async {
    try {
      setImageUploading(true);

      await picker.pickerFromCamera(
        context: context,
        callBackFunction: (imageFromCamera) async {
          try {
            final storage = Storage();

            if (!_hasImage) {
              await storage.uploadAvatar(
                id: userId,
                image: File(imageFromCamera.path),
                table: 'avatars',
              );
            } else {
              await storage.updateAvatar(
                id: userId,
                image: File(imageFromCamera.path),
                table: 'avatars',
              );
            }

            // Get the uploaded image URL
            final imageUrl = await storage.getUrlImage(
              id: userId,
              table: 'avatars',
            );

            _updateImageState(imageUrl);
            setImageUploading(false);

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.white),
                      SizedBox(width: 8),
                      Text('Profile picture updated successfully'),
                    ],
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          } catch (e) {
            setImageUploading(false);
            if (context.mounted) {
              CustomErrorWidget.showError(
                context,
                'Failed to upload image: $e',
              );
            }
          }
        },
      );
    } catch (e) {
      setImageUploading(false);
      if (context.mounted) {
        CustomErrorWidget.showError(context, 'Failed to access camera: $e');
      }
    }
  }

  // Pick image from gallery
  Future<void> pickerFromGallery(BuildContext context) async {
    try {
      setImageUploading(true);

      await picker.pickerFromGallery(
        context: context,
        callBackFunction: (imageFromGallery) async {
          try {
            final storage = Storage();

            if (!_hasImage) {
              await storage.uploadAvatar(
                id: userId,
                image: File(imageFromGallery.path),
                table: 'avatars',
              );
            } else {
              await storage.updateAvatar(
                id: userId,
                image: File(imageFromGallery.path),
                table: 'avatars',
              );
            }

            // Get the uploaded image URL
            final imageUrl = await storage.getUrlImage(
              id: userId,
              table: 'avatars',
            );

            _updateImageState(imageUrl);
            setImageUploading(false);

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.white),
                      SizedBox(width: 8),
                      Text('Profile picture updated successfully'),
                    ],
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          } catch (e) {
            setImageUploading(false);
            if (context.mounted) {
              CustomErrorWidget.showError(
                context,
                'Failed to upload image: $e',
              );
            }
          }
        },
      );
    } catch (e) {
      setImageUploading(false);
      if (context.mounted) {
        CustomErrorWidget.showError(context, 'Failed to access gallery: $e');
      }
    }
  }

  // Delete job with proper state management
  Future<void> deleteJob({
    required JobModel job,
    required BuildContext context,
  }) async {
    try {
      setDeletingJob(true);
      setError(null);

      final String? jobId = await SupaBaseData().jobId(job: job);

      if (jobId == null) {
        throw Exception(
          "Unable to locate job. It may have already been deleted.",
        );
      }

      await SupaBaseData().deleteJobPost(jobId: jobId);

      // Update local state by removing the job from pastWork
      if (_userData != null) {
        final updatedPastWork = _userData!.pastWork
            .where((pastJob) => pastJob.id != job.id)
            .toList();

        _userData = _userData!.copyWith(pastWork: updatedPastWork);
      }

      setDeletingJob(false);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Job deleted successfully'),
            backgroundColor: Theme.of(context).colorScheme.primary,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } on AuthException catch (e) {
      setDeletingJob(false);
      if (context.mounted) {
        CustomErrorWidget.showError(
          context,
          'Authentication error: ${e.message}',
        );
      }
    } catch (e) {
      setDeletingJob(false);
      if (context.mounted) {
        CustomErrorWidget.showError(
          context,
          e.toString().replaceAll('Exception: ', ''),
        );
      }
    }
  }

  // Delete profile image
  Future<void> deleteProfileImage(BuildContext context) async {
    try {
      setImageUploading(true);

      final storage = Storage();
      await storage.deleterAvatar(id: userId);

      // Update local state
      _imageUrl = null;
      _hasImage = false;

      // Update user data if available
      if (_userData != null) {
        _userData = _userData!.copyWith(imageId: '');
      }

      setImageUploading(false);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.delete_outline, color: Colors.white),
                SizedBox(width: 8),
                Text('Profile picture removed successfully'),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      setImageUploading(false);
      if (context.mounted) {
        CustomErrorWidget.showError(
          context,
          'Failed to delete profile image: $e',
        );
      }
    }
  }

  // Retry loading data
  Future<void> retry() async {
    await initialize();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
