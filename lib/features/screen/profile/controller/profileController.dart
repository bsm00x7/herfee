import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:herfee/core/utils/error/error.dart';
import 'package:herfee/features/auth/domain/auth.dart';
import 'package:herfee/service/model/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../generated/l10n.dart';
import '../../../../service/model/job_model.dart';
import '../../../auth/data/data.dart';
import '../../../auth/data/storge.dart';

class ProfileController with ChangeNotifier {
  final  s = S.current;
  bool _isloading = false;
  bool _haveImage = false;
  bool get haveImage =>_haveImage;
  bool get isLoading => _isloading;
  final userId =  AuthNotifier().user!.id;
  final ImagePicker _picker = ImagePicker();
  void setImage(bool value){
    _haveImage = value;
    notifyListeners();
  }
  void setLoading(bool value) {
    _isloading = value;
    notifyListeners();
  }
  Future<UserModel> getUser() async {
    var userData = await SupaBaseData().user();
    if (userData.imageId.isEmpty){
      String? imageUrl;
      imageUrl = await Storage().getUrlImage(id: userData.id);
      if (imageUrl !=null){
        SupaBaseData().updateUser(id: userId,image: imageUrl );
      }
      userData= userData.copyWith(imageId: imageUrl);
    }
    // Fetch additional user data in parallel for better performance
    final results = await Future.wait([
        SupaBaseData().getExperience(userId: userId),
        SupaBaseData().getJob(userId: userId),
    ]);

    final List<Experience> listOfExperience = results[0] as List<Experience>;
    final List<JobModel> listOfJob = results[1] as List<JobModel>;

    // Update userData with experience and jobs if available
    if (listOfExperience.isNotEmpty) {
      userData = userData.copyWith(experience: listOfExperience);
    }

    if (listOfJob.isNotEmpty) {
      userData = userData.copyWith(pastWork: listOfJob);
    }


    return userData;

  }

  void pickerFromCamera({required BuildContext context }) async{
    PermissionStatus status = await Permission.camera.request();
    final XFile? imageFromCamera = await _picker.pickImage(source: ImageSource.camera);
    if (status.isGranted) {
      if (imageFromCamera != null) {
        if (haveImage==false){
          await Storage().uploadAvatar(id:userId, image: File(imageFromCamera.path));
        }else{
          await Storage().updateAvatar(id:userId, image: File(imageFromCamera.path));
        }
      }
    }else if (status.isDenied) {
      CustomErrorWidget.showError(context, s.PermissionDenied);
      openAppSettings();
    }
    else if (status.isPermanentlyDenied){
      // The user opted to never again be asked for the permission.
      openAppSettings();
    }


  }

 Future<void> isExistsImage() async{
    final response = await Storage().existsImage(id: userId);
    if (response == true){
      setImage(true);
    }else{
      setImage(false);
    }
 }
}
