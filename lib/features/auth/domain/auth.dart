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

  Future<void> resetPassword({required String email}) async {
    await supabase.auth.resetPasswordForEmail(email);
  }

  Future<AuthResponse> signInWithAddressAndPassword({
    required String email,
    required String password,
  }) async {
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

  Future<void> updatePassword({required String newPassword}) async {
    await supabase.auth.updateUser(
      UserAttributes(password: newPassword.trim()),
    );
  }

  Future<AuthResponse> singUpUser({
    required String email,
    required String password,
    required String fullName,
  }) async {
    return await supabase.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': fullName, 'display_name': fullName},
    );
  }

  Future<void> resendEmail({required String email}) async {
    await supabase.auth.resend(email: email, type: OtpType.signup);
  }

  Future<bool> checkIfCorrectedOtp({
    required String email,
    required String codeOtp,
  }) async {
    try {
      final response = await supabase.auth.verifyOTP(
        type: OtpType.signup,
        email: email,
        token: codeOtp,
      );

      return response.session != null;
    } on AuthApiException catch (e) {
      debugPrint("Supabase Auth Error: ${e.message}");
      return false;
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      return false;
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}
