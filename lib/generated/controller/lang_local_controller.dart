import 'package:flutter/cupertino.dart';
import 'package:herfee/features/auth/shared_preferences/preference_manager.dart';
import '../../core/utils/const_storage.dart';

class LangController extends ChangeNotifier {
  String _locale = PreferenceManager().getString(StorageLang.lang) ?? "en";

  String get locale => _locale;

  void setLocale(String lang) async {
    _locale = lang;
    await PreferenceManager().setString(StorageLang.lang, _locale);
    notifyListeners();
  }

  Locale get appLocale {
    if (_locale.contains("_")) {
      final parts = _locale.split("_");
      return Locale(parts[0], parts[1]);
    }
    return Locale(_locale);
  }
}
