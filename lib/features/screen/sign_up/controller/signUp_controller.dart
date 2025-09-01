import 'dart:async';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'package:herfee/features/auth/domain/auth.dart';

import 'package:herfee/service/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/utils/loding/loding_indicator.dart';
import '../../../../generated/l10n.dart';
import '../../forgot_password_screen/screen_otp.dart';

class SignUpController with ChangeNotifier {
  //! Language localization
  final s = S.current;

  // Text Controllers
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword =
      TextEditingController();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerJob = TextEditingController();
  final TextEditingController controllerAbout = TextEditingController();

  // Form Keys
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> compKey = GlobalKey<FormState>();
  int numberOfCreationAccount = 0;

  // Private state variables
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String? _errorMessage;
  bool _isResendEmail = false;
  // Getters
  bool get isLoading => _isLoading;
  bool get isResendEmail =>_isResendEmail;

  bool get obscurePassword => _obscurePassword;

  bool get obscureConfirmPassword => _obscureConfirmPassword;

  String? get errorMessage => _errorMessage;

  // Password visibility toggles
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

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  void _setResendEmail(bool value) {
    _isResendEmail = true;
    notifyListeners();
  }

  /// Validators
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
    // Optional: Add more password requirements
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
      return "Password must contain uppercase, lowercase, and number";
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password";
    }
    if (value != controllerPassword.text) {
      return "Passwords don't match";
    }
    return null;
  }

  String? jobValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your job title';
    }
    if (value.trim().length < 2) {
      return 'Job title must be at least 2 characters';
    }
    return null;
  }

  String? aboutValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please tell us about yourself';
    }
    if (value.trim().length < 10) {
      return 'About section must be at least 10 characters';
    }
    return null;
  }

  String _getSignUpErrorMessage(String message) {
    final lowerMessage = message.toLowerCase();

    if (lowerMessage.contains('duplicate') ||
        lowerMessage.contains('already exists')) {
      return s.ThisEmailRegistered;
    }
    if (lowerMessage.contains('invalid email')) {
      return s.PleaseEnterValidEmailAddress;
    }
    if (lowerMessage.contains('weak password')) {
      return s.PasswordWeak;
    }
    if (lowerMessage.contains('rate limit')) {
      return s.TooManyAttempts;
    }
    if (lowerMessage.contains('network')) {
      return s.Network;
    }

    return message.isNotEmpty ? message : s.SomethingWentWrong;
  }

  Future<bool> _createUserProfile(User supabaseUser) async {
    try {
      final user = UserModel(
        id: supabaseUser.id,
        imageId: '',
        userName: controllerName.text.trim(),
        jobe: controllerJob.text.trim(),
        rating: '0',
        reviwes: '0',
        about: controllerAbout.text.trim(),
        pastWork: null,
        experience: null,
      );

      await AuthNotifier().insertToDataBase(user: user.toMap());
      return true;
    } catch (e) {
      debugPrint('Error creating user profile: $e');
      return false;
    }
  }

  // Signe Up [Create Account New User]

  Future<void> signUpUser(BuildContext context) async {
    if (formKey.currentState != null) {
      if (!formKey.currentState!.validate()) return;
    }
    if (compKey.currentState != null) {
      if (!compKey.currentState!.validate()) return;
    }
    _setLoading(true);
    final response = await AuthNotifier().singUpUser(
      email: controllerEmail.text.trim(),
      password: controllerPassword.text.trim(),
      fullName: controllerName.text.trim(),
    );
    _setLoading(false);
    if (response.user != null) {
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ScreenOtp();
            },
          ),
        );
      }
    }
  }

  Future<bool> onCheckConfirmation(
    String verificationCode,
    BuildContext context,
  ) async {
    LoadingIndicator.setLoading(context);
    final bool = await AuthNotifier().checkIfCorrectedOtp(
      email: controllerEmail.text.trim(),
      codeOtp: verificationCode,
    );
    if (bool) {
      return true;
    } else {
      return false;
    }
  }

  void onResendEmail(BuildContext context) async {
    _setResendEmail(true);
    await AuthNotifier().resendEmail(email: controllerEmail.text.trim());
    _setResendEmail(false);
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerConfirmPassword.dispose();
    controllerName.dispose();
    controllerJob.dispose();
    controllerAbout.dispose();
    super.dispose();
  }
}
