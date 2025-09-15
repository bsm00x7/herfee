import 'package:flutter/cupertino.dart';

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
    return response;
  }
}
