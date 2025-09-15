import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herfee/core/utils/error/error.dart';
import 'package:herfee/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../features/auth/data/storge.dart';

class ShowButtomSheet {
  static void showImagePicker(
    BuildContext context,
    ThemeData theme,
    dynamic s,
    Size size,
    String id,
  ) {
    // Get the provider instance before showing the modal to avoid context issues

    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: theme.colorScheme.surface,
      elevation: 8,
      constraints: BoxConstraints(
        maxHeight: size.height * 0.4,
        minHeight: size.height * 0.2,
      ),
      context: context,
      builder: (modalContext) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.colorScheme.surface,
                theme.colorScheme.surfaceContainerLowest,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Modal Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 16, top: 8),
                  child: Text(
                    'Select Image Source',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),

                // Camera Option
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: theme.colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.3,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () async {
                      Navigator.pop(modalContext);
                      // Use the provider instance we got before showing the modal
                      try {
                        /// add Function for Picker Image From Camera
                        PickerImageClasse().pickerFromCamera(
                          context: context,
                          callBackFunction: (XFile imageFromCamera) async {
                            await Storage().uploadAvatar(
                              id: "$id post",
                              image: File(imageFromCamera.path),
                              table: 'jobeAvatar',
                            );
                          },
                        );
                      } catch (e) {
                        // Handle error if needed
                        debugPrint('Error picking image from camera: $e');
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error accessing camera: $e'),
                              backgroundColor: theme.colorScheme.error,
                            ),
                          );
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colorScheme.primaryContainer,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.camera,
                              size: 20,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  s.Camera,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Take a new photo',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Gallery Option
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: theme.colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.3,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () async {
                      Navigator.pop(modalContext);
                      // Add gallery picker functionality using the same profileController instance
                      try {
                        /// add Function for Picker Image From Gallery
                      } catch (e) {
                        // Handle error if needed
                        debugPrint('Error picking image from gallery: $e');
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error accessing gallery: $e'),
                              backgroundColor: theme.colorScheme.error,
                            ),
                          );
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colorScheme.secondaryContainer,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.images,
                              size: 20,
                              color: theme.colorScheme.onSecondaryContainer,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  s.Gallery ?? 'Gallery',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Choose from existing photos',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PickerImageClasse {
  final ImagePicker _picker = ImagePicker();
  final s = S.current;
  Future<void> pickerFromCamera({
    required BuildContext context,
    required Future Function(XFile) callBackFunction,
  }) async {
    PermissionStatus status = await Permission.camera.request();
    final XFile? imageFromCamera = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (status.isGranted) {
      if (imageFromCamera != null) {
        callBackFunction(imageFromCamera);
      }
    } else if (status.isDenied) {
      if (context.mounted) {
        CustomErrorWidget.showError(context, s.PermissionDenied);
      }

      openAppSettings();
    } else if (status.isPermanentlyDenied) {
      // The user opted to never again be asked for the permission.
      openAppSettings();
    }
  }

  Future<void> pickerFromGallery({
    required BuildContext context,
    required Future Function(XFile) callBackFunction,
  }) async {
    PermissionStatus status = await Permission.photos.request();
    final XFile? imageFromGallery = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (status.isGranted) {
      if (imageFromGallery != null) {
        callBackFunction(imageFromGallery);
      }
    } else if (status.isDenied) {
      if (context.mounted) {
        CustomErrorWidget.showError(context, s.PermissionDenied);
      }

      openAppSettings();
    } else if (status.isPermanentlyDenied) {
      // The user opted to never again be asked for the permission.
      openAppSettings();
    }
  }
}
