import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../signin/account_confirmation_dialog.dart';
class SignUpController with ChangeNotifier {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword = TextEditingController();
  final TextEditingController controllerName = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  bool get obscurePassword => _obscurePassword;
  bool get obscureConfirmPassword => _obscureConfirmPassword;
  String? get errorMessage => _errorMessage;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _obscureConfirmPassword = !_obscureConfirmPassword;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
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

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
      return "Password must contain uppercase, lowercase, and numbers";
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value != controllerPassword.text) {
      return "Passwords don't match";
    }
    return null;
  }

  Future<void> signUpUser(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    _setLoading(true);
    clearError();

    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: controllerEmail.text.trim(),
        password: controllerPassword.text.trim(),
        data: {
          'full_name': controllerName.text.trim(),
          'display_name': controllerName.text.trim(),
        },
      );

      if (response.user != null) {
        await AccountConfirmationDialog.showAccountCreatedDialog(
          context,
          email: controllerEmail.text.trim(),
          onContinue: () {
            if (context.mounted) {
              context.go('/login');
            }
          },
        );
        _clearForm();
      }

    } on AuthException catch (e) {
      _errorMessage = _getSignUpErrorMessage(e.message);
      _showErrorSnackBar(context, _errorMessage!);
    } catch (e) {
      _errorMessage = "Something went wrong. Please try again.";
      _showErrorSnackBar(context, _errorMessage!);
    } finally {
      _setLoading(false);
    }
  }

  String _getSignUpErrorMessage(String message) {
    switch (message.toLowerCase()) {
      case "user already registered":
        return "This email is already registered. Try signing in instead.";
      case "password should be at least 6 characters":
        return "Password must be at least 6 characters long.";
      case "signup is disabled":
        return "Account creation is temporarily disabled.";
      case "invalid email":
        return "Please enter a valid email address.";
      default:
        return "Failed to create account. Please try again.";
    }
  }

  void _clearForm() {
    controllerEmail.clear();
    controllerPassword.clear();
    controllerConfirmPassword.clear();
    controllerName.clear();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerConfirmPassword.dispose();
    controllerName.dispose();
    super.dispose();
  }
}
