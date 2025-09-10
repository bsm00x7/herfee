import 'package:flutter/cupertino.dart';
import 'package:herfee/features/auth/data/data.dart';

class ControllerSetting with ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  ControllerSetting(){
    init();
  }
  bool isOnline = true;

  void setOnline(bool value) {
    isOnline = value;
    notifyListeners();
  }

  Future<void> changeStauts(bool value) async {
    setOnline(value);
    await SupaBaseData().updateUserStatus(value: value);
  }

  void init() async {
    await SupaBaseData().updateUserStatus(value: true);
  }
}
