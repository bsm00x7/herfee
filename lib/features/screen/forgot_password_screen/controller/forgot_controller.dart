import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:herfee/features/screen/forgot_password_screen/screen_otp.dart';
import 'package:herfee/service/auth/auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/utils/error/error.dart';
class ForgotPasswordController with ChangeNotifier {
  final TextEditingController controllerEmail = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  //Controller Otp Screen
  final TextEditingController controllerOtp = TextEditingController();
  final GlobalKey<FormState> otpKey = GlobalKey<FormState>();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

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
      return 'Please enter an email address';
    } else if (!EmailValidator.validate(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }



  String _mapErrorMessage(String code) {
    switch (code) {
      case "invalid_email":
        return "Please enter a valid email address.";
      case "user_not_found":
        return "No account found with this email.";
      case "email_not_confirmed":
        return "Please confirm your email before resetting your password.";
      case "too_many_requests":
        return "Too many attempts. Please wait and try again.";
      case "network_error":
        return "Check your internet connection and try again.";
      default:
        return "Something went wrong. Please try again.";
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

      final response = await AuthNotifier().verifyCodeOtp(
        otp: controllerOtp.text.trim(),
        email: controllerEmail.text.trim(),
      );

      // ✅ Handle success
      if (response.session != null || response.user != null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("OTP verified successfully!")),
          );

          // Example: Navigate to reset password screen
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => const ResetPasswordScreen(),
          //   ),
          // );
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


}







  //////////////////////////////////////////////////////////////////////////////////////////////





