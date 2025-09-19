import 'dart:io';

import 'package:flutter/cupertino.dart';
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
  bool _isloading = false;
  bool _haveImage = false;
  bool get haveImage => _haveImage;
  bool get isLoading => _isloading;

  final userId = AuthNotifier().user!.id;
  void setImage(bool value) {
    _haveImage = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  Future<UserModel> getUser() async {
    final response = await SupaBaseData().user();

    return response;
  }

  final picker = PickerImageClasse();

  void pickerFromCamera({
    required BuildContext context,
    required bool haveImage,
  }) async {
    picker.pickerFromCamera(
      context: context,
      callBackFunction: (imageFromCamera) async {
        if (haveImage == false) {
          await Storage().uploadAvatar(
            id: userId,
            image: File(imageFromCamera.path),
            table: 'avatars',
          );
        } else {
          await Storage().updateAvatar(
            id: userId,
            image: File(imageFromCamera.path),
            table: 'avatars',
          );
        }
        notifyListeners();
      },
    );
  }

  void pickerFromGallery({
    required BuildContext context,
    required bool haveImage,
  }) async {
    picker.pickerFromGallery(
      context: context,
      callBackFunction: (imageFromGallery) async {
        if (haveImage == false) {
          await Storage().uploadAvatar(
            id: userId,
            image: File(imageFromGallery.path),
            table: 'avatars',
          );
        } else {
          await Storage().updateAvatar(
            id: userId,
            image: File(imageFromGallery.path),
            table: 'avatars',
          );
        }
        notifyListeners();
      },
    );
  }

  Future<void> isExistsImage() async {
    final response = await Storage().existsImage(id: userId, table: 'avatars');
    if (response == true) {
      setImage(true);
    } else {
      setImage(false);
    }
  }

  void deleterJob({
    required JobModel job,
    required BuildContext context,
  }) async {
    final String? idjob = await SupaBaseData().jobId(job: job);
    debugPrint(idjob);
    if (idjob == null) {
      if (context.mounted) {
        CustomErrorWidget.showError(context, "Try Again ");
      }

      return;
    }
    try {
      setLoading(true);

      await SupaBaseData().deleteJobPost(jobId: idjob);
      setLoading(false);
    } on AuthException catch (e) {
      if (context.mounted) {
        CustomErrorWidget.showError(context, e.message);
      }
    }
    notifyListeners();
  }
}
