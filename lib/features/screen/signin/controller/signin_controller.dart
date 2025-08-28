import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/utils/error/error.dart';
import '../../../../service/auth/auth.dart';
import '../account_confirmation_dialog.dart';

class SignInController with ChangeNotifier {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  String? emailValidator(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Please enter an email address.';
    } else if (!EmailValidator.validate(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your password";
    }
    if (value.trim().length < 8) {
      return "Password must be at least 8 characters long";
    }
    return null;
  }

  Future<void> signIntoApp(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        _setLoading(true);
        final response = await AuthNotifier().signInWithAddressAndPassword(
          email: controllerEmail.text.trim(),
          password: controllerPassword.text,
        );

        final user = response.user;

        if (user == null) {
          CustomErrorWidget.showError(context, "Login failed. Please try again.");
          return;
        }

        // 🚨 Check if email is confirmed
        if (user.emailConfirmedAt == null) {
          await showBottomSheetConfirmation(context);
          return;
        }

        // 🎉 Success → navigate to home
        if (context.mounted) {

        }

      } on AuthException catch (e) {
        String errorMessage = _getErrorMessage(e.message);
        CustomErrorWidget.showError(context, errorMessage);
      } catch (e) {
        CustomErrorWidget.showError(context, "Something went wrong: $e");
      } finally {
        _setLoading(false);
      }
    }
  }



  /// Alternative: Show bottom sheet confirmation
  Future<void> showBottomSheetConfirmation(BuildContext context) async {
    await AccountConfirmationDialog.showBottomSheetConfirmation(
      context,
      email: controllerEmail.text.trim(),
      onResendEmail: () => _resendConfirmationEmail(context),
      onGoToLogin: () {
        controllerEmail.clear();
        controllerPassword.clear();
      },
    );
  }



  /// Resend confirmation email
  Future<void> _resendConfirmationEmail(BuildContext context) async {
    try {
      await Supabase.instance.client.auth.resend(
        type: OtpType.signup,
        email: controllerEmail.text.trim(),
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Confirmation email sent successfully!'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        CustomErrorWidget.showError(
          context,
          "Failed to resend confirmation email. Please try again.",
        );
      }
    }
  }

  /// Get user-friendly error messages
  String _getErrorMessage(String message) {
    switch (message.toLowerCase()) {
      case "invalid login credentials":
        return "The email or password you entered is incorrect. Please try again.";
      case "email already registered":
        return "This email is already registered. Try signing in instead.";
      case "invalid password":
        return "Invalid password. Please check and try again.";
      case "invalid email":
        return "Please enter a valid email address.";
      case "too many requests":
        return "Too many login attempts. Please wait a moment and try again.";
      default:
        return "Something went wrong. Please try again.";
    }
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }
}