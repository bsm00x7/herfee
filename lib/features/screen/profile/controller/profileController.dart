import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:herfee/core/utils/error/error.dart';
import 'package:herfee/features/auth/domain/auth.dart';
import 'package:herfee/service/model/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../generated/l10n.dart';
import '../../../auth/data/data.dart';
import '../../../auth/data/storge.dart';

class ProfileController with ChangeNotifier {
  final  s = S.current;
  bool _isloading = false;
  bool get isLoading => _isloading;
  void setLoading(bool value) {
    _isloading = value;
    notifyListeners();
  }
  Future<UserModel> getUser() async {
    final userData = await SupaBaseData().user();
    String? imageUrl;
    imageUrl = await Storage().getUrlImage(id: '${userData.id}.jpg');
    return userData.copyWith(imageId: imageUrl);
  }

  void pickerFromCamera({required BuildContext context , required bool firstTime}) async{
    PermissionStatus status = await Permission.camera.request();
    final ImagePicker _picker = ImagePicker();
    final XFile? imageFromCamera = await _picker.pickImage(source: ImageSource.camera);
    if (status.isGranted) {
      // Either the permission was already granted before or the user just granted it.
      if (imageFromCamera != null) {
        final userId = AuthNotifier().user!.id;

        Uint8List fileBytes = await imageFromCamera!.readAsBytes();
        if (firstTime == true){
          Storage().uploadAvatar(fileBytes: fileBytes, userId: userId);
        }
      }
    }else if (status.isDenied) {
      // The permission was denied, but not permanently. You can show a dialog or something.
      CustomErrorWidget.showError(context, s.PermissionDenied);

      openAppSettings();
    }
    else if (status.isPermanentlyDenied){
      // The user opted to never again be asked for the permission.
      openAppSettings();
    }


  }
}
