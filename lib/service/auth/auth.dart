import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthNotifier extends ChangeNotifier {
  final supabase = Supabase.instance.client;

  AuthNotifier() {
    supabase.auth.onAuthStateChange.listen((event) {
      notifyListeners();
    });
  }

  bool get isLoggedIn => supabase.auth.currentSession != null;



  Future <void> signInWithAddressAndPassword ({required String email, required String password})async{
    await Supabase.instance.client.auth.signUp(
        email: email.trim(),
        password: password.trim(),
    );
  }








}
