import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:herfee/features/screen/forgot_password_screen/screen_otp.dart';
import 'package:herfee/service/auth/auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/utils/error/error.dart';
import '../../../../generated/l10n.dart';
import '../../reset_password_screen/reset_password_screen.dart';
class ForgotPasswordController with ChangeNotifier {
  final s = S.current;
  final TextEditingController controllerEmail = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //Controller Otp Screen
  final TextEditingController controllerOtp = TextEditingController();
  final GlobalKey<FormState> otpKey = GlobalKey<FormState>();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;



  // Controller Reset Password Screnn
  final TextEditingController controllerPassword = TextEditingController();
  final GlobalKey<FormState> resetKet = GlobalKey<FormState>();


  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  String? emailValidator(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return s.PleaseEnterAnEmailAddress;
    } else if (!EmailValidator.validate(email)) {
      return s.PleaseEnterValidEmailAddress;
    }
    return null;
  }



  String _mapErrorMessage(String code) {
    switch (code) {
      case "invalid_email":
        return s.PleaseEnterValidEmailAddress;
      case "user_not_found":
        return s.NoAccountFoundWithThisEmail;
      case "email_not_confirmed":
        return s.PleaseConfirmYourEmail;
      case "too_many_requests":
        return s.TooManyAttempts;
      case "network_error":
        return s.CheckYourInternet;
      default:
        return s.SomethingWentWrong;
    }
  }

  Future<void> sendResetEmail({required BuildContext context}) async {
    if (formKey.currentState?.validate() != true) return;

    try {
      _setLoading(true);

      await AuthNotifier().resetPassword(
        email: controllerEmail.text.trim(),
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password reset email sent successfully!")),
        );

        Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenOtp(),));
      }


    } on AuthException catch (e) {
      _errorMessage = _mapErrorMessage(e.code!);
      if (context.mounted) {
        CustomErrorWidget.showError(context, _errorMessage!);
      }

    } catch (e) {
      _errorMessage = "An unexpected error occurred. Please try again.";
      if (context.mounted) {
        CustomErrorWidget.showError(context, _errorMessage!);
      }

    } finally {
      _setLoading(false);
      notifyListeners();
    }
  }
  String _mapOtpError(String code) {
    debugPrint(code);
    switch (code) {
      case "otp_expired":
        return "This code has expired. Please request a new one.";
      case "otp_incorrect":
        return "The code you entered is incorrect. Please try again.";
      case "user_not_found":
        return "No account found with this email.";
      case "invalid_request":
        return "Invalid request. Please try again.";
      default:
        return "OTP verification failed. Please try again.";
    }
  }


  
  String? otpValidator(String? value) {
    if (value == null || value.trim().isEmpty ){
      return 'Please enter an OTP';
    }else if (value.length != 6){
      return 'OTP must be 6 digits';
    }
    return null;
    }

  void checkOtpCode({required BuildContext context}) async {
    if (otpKey.currentState?.validate() != true) return;

    try {
      _setLoading(true);
      debugPrint(controllerOtp.text);
      final response = await AuthNotifier().verifyCodeOtp(
        otp: controllerOtp.text.trim(),
        email: controllerEmail.text.trim(),

      );
      debugPrint(response.user.toString());

      if (response.session != null || response.user != null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("OTP verified successfully!")),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) =>  ResetPasswordScreen(),
            ),
          );
        }
      }

    } on AuthException catch (e) {
      final friendlyMessage = _mapOtpError(e.code!);
      if (context.mounted) {
        CustomErrorWidget.showError(context, friendlyMessage);
      }

    } catch (e) {
      if (context.mounted) {
        CustomErrorWidget.showError(
          context,
          "Something went wrong. Please try again.",
        );
      }

    } finally {
      _setLoading(false);
      notifyListeners();
    }
  }


  String? validatorPassword(String? value){
    if (value == null || value.trim().isEmpty){
      return s.PleaseEnterYourPassword;
    }
    return null;
  }

  void restPassword ({required BuildContext context}) async {
    _setLoading(true);
     await AuthNotifier().updatePassword(newPassword: controllerPassword.text);
    _setLoading(false);
  }

}







  //////////////////////////////////////////////////////////////////////////////////////////////





