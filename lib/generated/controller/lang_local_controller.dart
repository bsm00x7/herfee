import 'package:flutter/cupertino.dart';
import 'package:herfee/features/auth/shared_preferences/preference_manager.dart';

import '../../core/utils/const_storage.dart';

class LangController extends ChangeNotifier {




  String? locale = PreferenceManager().getString(Storage.lang);
  void setLocale(String lang) {
    locale = lang;
    if (locale != null) {
      PreferenceManager().setString(Storage.lang, locale!);
      notifyListeners();
    }
    notifyListeners();
  }


}