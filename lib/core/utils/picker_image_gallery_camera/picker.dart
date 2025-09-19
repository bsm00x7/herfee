import 'package:flutter/material.dart';

import 'package:herfee/core/utils/error/error.dart';
import 'package:herfee/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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
    } else if (status.isPermanentlyDenied) {
      // The user opted to never again be asked for the permission.
      openAppSettings();
    }
  }
}
