import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class ForgotPasswordController with ChangeNotifier {
  final TextEditingController controllerEmail = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool _emailSent = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  bool get emailSent => _emailSent;
  String? get errorMessage => _errorMessage;

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

  Future<void> sendResetEmail(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    _setLoading(true);
    clearError();

    try {
      await Supabase.instance.client.auth.resetPasswordForEmail(
        controllerEmail.text.trim(),
        redirectTo: 'yourapp://reset-password',
      );

      _emailSent = true;
      _showSuccessDialog(context);

    } on AuthException catch (e) {
      _errorMessage = _getResetErrorMessage(e.message);
      _showErrorSnackBar(context, _errorMessage!);
    } catch (e) {
      _errorMessage = "Something went wrong. Please try again.";
      _showErrorSnackBar(context, _errorMessage!);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _showSuccessDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          icon: const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 48,
          ),
          title: const Text(
            'Reset Link Sent',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'We\'ve sent a password reset link to:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                controllerEmail.text.trim(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Please check your email and click the reset link to create a new password.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (context.mounted) {
                  context.go('/login');
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Back to Login'),
            ),
          ],
        );
      },
    );
  }

  String _getResetErrorMessage(String message) {
    switch (message.toLowerCase()) {
      case "user not found":
        return "No account found with this email address.";
      case "invalid email":
        return "Please enter a valid email address.";
      default:
        return "Failed to send reset email. Please try again.";
    }
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
    super.dispose();
  }
}
