import 'package:flutter/cupertino.dart';
import 'package:herfee/service/model/user_model.dart';


import '../../../auth/data/data.dart';
import '../../../auth/data/storge.dart';

class ProfileController with ChangeNotifier{
  bool _isloading = false;
  bool get isLoading => _isloading;
  void setLoading(bool value){
    _isloading = value;
    notifyListeners();
  }

  Future<UserModel> getUser() async{
    setLoading(true);
    final userData =  await SupaBaseData().user();
    final imageUrl = await Storage().getUrlImage(id: '${userData.id}.jpg');
    setLoading(false);

   return userData.copyWith(imageId:imageUrl );
  }

}