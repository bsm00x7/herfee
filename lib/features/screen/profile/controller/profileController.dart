import 'package:flutter/cupertino.dart';
import 'package:herfee/service/model/user_model.dart';

import '../../../auth/data/data.dart';
import '../../../auth/data/storge.dart';

class ProfileController with ChangeNotifier {
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
}
