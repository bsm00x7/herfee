import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:herfee/features/auth/domain/auth.dart';
import 'package:herfee/service/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/utils/error/error.dart';
import '../../../../generated/l10n.dart';
import '../../signin/account_confirmation_dialog.dart';

class SignUpController with ChangeNotifier {
  //! Language localization
  final s = S.current;

  // Text Controllers
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword = TextEditingController();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerJob = TextEditingController();
  final TextEditingController controllerAbout = TextEditingController();

  // Form Keys
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> compKey = GlobalKey<FormState>();

  // Private state variables
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String? _errorMessage;
  bool _emailConfirmationRequired = false;

  // Getters
  bool get isLoading => _isLoading;
  bool get obscurePassword => _obscurePassword;
  bool get obscureConfirmPassword => _obscureConfirmPassword;
  String? get errorMessage => _errorMessage;
  bool get emailConfirmationRequired => _emailConfirmationRequired;

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

  void _setEmailConfirmationRequired(bool value) {
    _emailConfirmationRequired = value;
    notifyListeners();
  }

  void _clearForm() {
    controllerEmail.clear();
    controllerPassword.clear();
    controllerConfirmPassword.clear();
    controllerName.clear();
    controllerJob.clear();
    controllerAbout.clear();
    _errorMessage = null;
    _emailConfirmationRequired = false;
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
    // Enhanced error message mapping
    final lowerMessage = message.toLowerCase();

    if (lowerMessage.contains('duplicate') || lowerMessage.contains('already exists')) {
      return 'This email is already registered. Please use a different email or try signing in.';
    }
    if (lowerMessage.contains('invalid email')) {
      return 'Please enter a valid email address';
    }
    if (lowerMessage.contains('weak password')) {
      return 'Password is too weak. Please choose a stronger password.';
    }
    if (lowerMessage.contains('rate limit')) {
      return 'Too many attempts. Please wait a moment and try again.';
    }
    if (lowerMessage.contains('network')) {
      return 'Network error. Please check your connection and try again.';
    }

    return message.isNotEmpty ? message : 'Something went wrong. Please try again.';
  }

  /// Create user profile in database
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

  /// Main sign up method
  Future<void> signUpUser(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    _setLoading(true);
    clearError();

    try {
      // Attempt to sign up user
      final AuthResponse response = await AuthNotifier().singUpUser(
        email: controllerEmail.text.trim(),
        password: controllerPassword.text.trim(),
        fullName: controllerName.text.trim(),
      );

      if (response.user == null) {
        _errorMessage = 'Failed to create account. Please try again.';
        CustomErrorWidget.showError(context, _errorMessage!);
        return;
      }

      // Check if email confirmation is required
      if (response.user!.confirmationSentAt != null) {
        // Email confirmation required - show confirmation dialog
        _setEmailConfirmationRequired(true);

        if (context.mounted) {
          await AccountConfirmationDialog.showBottomSheetConfirmation(
            context,
            email: controllerEmail.text.trim(),
            onResendEmail: () => _resendConfirmationEmail(context),
            onCheckConfirmation: () => _checkEmailConfirmation(context,response),
          );
        }
      } else {
        // No email confirmation required - proceed with profile creation
        await _completeSignUpProcess(context, response.user!);
      }
    } on AuthException catch (e) {
      _errorMessage = _getSignUpErrorMessage(e.message);
      if (context.mounted) {
        CustomErrorWidget.showError(context, _errorMessage!);
      }
    } catch (e) {
      debugPrint('Sign up error: $e');
      _errorMessage = "Something went wrong. Please try again.";
      if (context.mounted) {
        CustomErrorWidget.showError(context, _errorMessage!);
      }
    } finally {
      _setLoading(false);
    }
  }

  /// Complete the sign-up process with profile creation
  Future<void> _completeSignUpProcess(BuildContext context, User user) async {
    // Validate complete profile form
    if (!compKey.currentState!.validate()) {
      _errorMessage = 'Please complete all required profile fields';
      CustomErrorWidget.showError(context, _errorMessage!);
      return;
    }

    _setLoading(true);
    clearError();

    try {
      // Create user profile
      final profileCreated = await _createUserProfile(user);

      if (profileCreated) {
        // Show success dialog and navigate to login
        if (context.mounted) {
          await AccountConfirmationDialog.showAccountCreatedDialog(
            context,
            email: controllerEmail.text.trim(),
            onContinue: () {
              if (context.mounted) {
                context.go('/login');
              }
            },
          );
        }
        _clearForm();
      } else {
        // Profile creation failed - clean up and show error
        await _cleanupFailedSignUp(user.id);
        _errorMessage = 'Failed to create user profile. Please try again.';
        if (context.mounted) {
          CustomErrorWidget.showError(context, _errorMessage!);
        }
      }
    } catch (e) {
      debugPrint('Profile creation error: $e');
      await _cleanupFailedSignUp(user.id);
      _errorMessage = 'Failed to complete registration. Please try again.';
      if (context.mounted) {
        CustomErrorWidget.showError(context, _errorMessage!);
      }
    } finally {
      _setLoading(false);
    }
  }

  /// Resend confirmation email
  Future<void> _resendConfirmationEmail(BuildContext context) async {
    try {
      _setLoading(true);
      clearError();

      await AuthNotifier().resendEmail(
        email: controllerEmail.text.trim(),
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Confirmation email sent successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error resending email: $e');
      _errorMessage = 'Failed to resend confirmation email. Please try again.';
      if (context.mounted) {
        CustomErrorWidget.showError(context, _errorMessage!);
      }
    } finally {
      _setLoading(false);
    }
  }
  /// Get user
  /// Check if email has been confirmed
  Future<void> _checkEmailConfirmation(BuildContext context, AuthResponse respone) async {
    try {
      _setLoading(true);
      clearError();


      final currentUser = respone.user;

      if (currentUser != null && currentUser.emailConfirmedAt != null) {

        Navigator.of(context).pop(); // Close confirmation dialog
        await _completeSignUpProcess(context, currentUser);
      } else {
        // Email not confirmed yet
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Email not confirmed yet. Please check your email.'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Error checking confirmation: $e');
      _errorMessage = 'Failed to check confirmation status. Please try again.';
      if (context.mounted) {
        CustomErrorWidget.showError(context, _errorMessage!);
      }
    } finally {
      _setLoading(false);
    }
  }

  /// Clean up failed sign up attempts
  Future<void> _cleanupFailedSignUp(String userId) async {
    try {
      await AuthNotifier().deleterUser(id: userId);
    } catch (e) {
      debugPrint('Error cleaning up failed sign up: $e');
      // Don't throw here as it's cleanup - just log the error
    }
  }

  /// Dispose method to clean up controllers
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