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
    JobModel(imageJob: "assets/image/Plumbing.png", job_title: 'Plumbing'),
    JobModel(imageJob: "assets/image/Electrical.png", job_title: 'Electrical'),
    JobModel(imageJob: "assets/image/Cleaning.png", job_title: 'Cleaning'),
    JobModel(imageJob: "assets/image/HandyMan.png", job_title: 'HandyMan'),
    JobModel(imageJob: "assets/image/Painting.png", job_title: 'Painting'),
    JobModel(imageJob: "assets/image/Plumbing.png", job_title: 'Plumbing'),
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
