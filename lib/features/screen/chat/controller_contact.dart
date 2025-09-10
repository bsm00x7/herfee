import 'package:flutter/material.dart';
import 'package:herfee/features/auth/data/data.dart';

class ControllerContact extends ChangeNotifier{

  bool _isLoading = false;
  bool get isLoading =>_isLoading;
  void setLoading (bool value){
    _isLoading = value;
    notifyListeners();
  }
  final String  _currentLoginUserId =SupaBaseData().currentLoginUser;



  Future<void> sendMessage ({required String recvId})async{
    debugPrint(recvId);
  }
}