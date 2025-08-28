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



  Future <AuthResponse> signInWithAddressAndPassword ({required String email, required String password})async{
   final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email.trim(),
        password: password.trim(),
    );
   return response;
  }








}
