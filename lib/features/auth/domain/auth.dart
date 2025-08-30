import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../service/model/job_model.dart';
import '../../../service/model/user_model.dart';

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
    return  await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': fullName, 'display_name': fullName},
    );
  }

  Future<AuthResponse> insertToDataBase({required Map<String,dynamic> user})async{
    return await supabase.from('users').insert({
      'id':user['id'] ,
      'image_id': user['imageId'], // optional default
      'user_name': user['userName'],
      'jobe': user['jobe'],
      'rating':user["rating"],
      'reviews': user['reviwes'],
      'about': user['about'],
    });
  }
  Future<AuthResponse> insertExperience({
    required String userId,
    required Experience experience,
  }) async {
    return await supabase.from('experiences').insert({
      'user_id': userId,
      'title': experience.title,
      'periode': experience.periode,
    });
  }
  Future<void> insertJob({
    required String userId,
    required JobModel job,
  }) async {
    await supabase.from('past_work').insert({
      'user_id': userId,
      'job_title': job.title,        // adjust fields to your JobModel
      'description': '',
    });
  }

  Future<void> deleterUser({required String id})async{
    await supabase.auth.admin.deleteUser(id);
  }


Future <void> resendEmail ({required String email})async{
  await Supabase.instance.client.auth.resend(
    email: email, type: OtpType.signup,
  );
}

}
