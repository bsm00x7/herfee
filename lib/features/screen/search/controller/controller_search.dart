import 'package:flutter/material.dart';
import 'package:herfee/features/auth/data/data.dart';
import 'package:herfee/service/model/user_model.dart';

class SerachController with ChangeNotifier {
  var _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  var _optionSelcted = false;
  bool get optionSelcted => _optionSelcted;

  void setOptionSelected(bool value) {
    _optionSelcted = value;
    notifyListeners();
  }

  Future<List<String>> listJob() async {
    final response = await SupaBaseData().listOfJob();
    return response;
  }

  List<UserModel> users = [];
  Future<void> findUserWithJobe({required String option}) async {
    users = await SupaBaseData().listOfUserFindWithJob(job: option);
    debugPrint(users.toString());
  }
}
