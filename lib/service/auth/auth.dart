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

  Future<void> resetPassword ({required String email})async{
     await supabase.auth.resetPasswordForEmail(email);
  }


  Future <AuthResponse> signInWithAddressAndPassword ({required String email, required String password})async{
   final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email.trim(),
        password: password.trim(),
    );
   return response;
  }


  Future<AuthResponse> verifyCodeOtp({
    required String otp,
    required String email,
  }) async {
    return supabase.auth.verifyOTP(
      type: OtpType.recovery,
      email: email,
      token: otp,
    );



  }

  Future <void> updatePassword({ required String newPassword})async{
    await supabase.auth.updateUser(
      UserAttributes(password: newPassword.trim()),
    );

  }







}
