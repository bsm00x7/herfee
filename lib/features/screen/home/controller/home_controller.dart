import 'package:flutter/cupertino.dart';
import 'package:herfee/features/auth/data/storge.dart';
import '../../../../service/model/job_model.dart';
import '../../../../service/model/user_model.dart';
import '../../../auth/data/data.dart';

class HomeController extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<JobModel> job = [
    JobModel(
      imageJob: "assets/image/Plumbing.png",
      job_title: 'Plumbing',
      id: "",
    ),
    JobModel(
      imageJob: "assets/image/Electrical.png",
      job_title: 'Electrical',
      id: "",
    ),
    JobModel(
      imageJob: "assets/image/Cleaning.png",
      job_title: 'Cleaning',
      id: "",
    ),
    JobModel(
      imageJob: "assets/image/HandyMan.png",
      job_title: 'HandyMan',
      id: "",
    ),
    JobModel(
      imageJob: "assets/image/Painting.png",
      job_title: 'Painting',
      id: "",
    ),
    JobModel(
      imageJob: "assets/image/Plumbing.png",
      job_title: 'Plumbing',
      id: "",
    ),
  ];
  Future<UserModel> goToProfile(String userId) async {
    var userData = await SupaBaseData().user(userId);
    return userData;
  }

  Future<List<UserModel>> listUsers() async {
    final response = await SupaBaseData().listUsers();

    // Use Future.wait to handle all async operations
    final updatedUsers = await Future.wait(
      response.map((user) async {
        final String? image = await Storage().getUrlImage(
          id: user.id,
          table: "avatars",
        );
        final bool haveImage = await Storage().existsImage(
          id: user.id,
          table: "avatars",
        );
        // Return the updated user with image URL or original user if no image
        if (image != null && image.isNotEmpty && haveImage) {
          return user.copyWith(imageId: image);
        }

        return user.copyWith(imageId: '');
      }),
    );

    return updatedUsers;
  }
}
