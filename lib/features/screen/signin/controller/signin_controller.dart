import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/utils/error/error.dart';
import '../../../../core/utils/loding/loding_indicator.dart';
import '../../../../service/auth/auth.dart';

class SignInController with ChangeNotifier {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? emailValidator(String? p1) {

    final bool isValid = EmailValidator.validate(controllerEmail.text.trim());
    if (controllerEmail.text.trim().isEmpty) {
      return 'Please enter an email address.';
    } else if (!isValid) {
      return 'Please Enter Corrected Email';
    }
    return null;
  }

  String? passwordValidator(String? p1) {

    if (p1 == null || p1.trim().isEmpty) {
      return "Please Enter Your Password";
    }
    if (p1.trim().length < 8) {
      return "Password must be at least 8 characters long.";
    }
    return null;
  }

  Future<void> signIntoApp(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      LoadingIndicator.setLoading(context, true); // Show loading indicator
      try {
        await AuthNotifier().signInWithAddressAndPassword(
          email: controllerEmail.text.trim(), // Good practice to trim inputs
          password: controllerPassword.text.trim(),
        );

        if (context.mounted) {
          context.pushReplacement('/'); // Navigate on success
        }
      } on AuthException catch (e) {
        String errorMessage;

        switch (e.message) {
          case "Invalid login credentials":
            errorMessage = "Invalid email or password. Please check your credentials and try again.";
            break;
         case "Email not confirmed":
           errorMessage = "Please confirm your email before signing in.";
           break;
          default:
            debugPrint("SignIn AuthException: ${e.message} (Code: ${e.statusCode})"); // Supabase example
            errorMessage = 'Sign-in failed. Please try again later.';
        }
        if (context.mounted) {
          CustomErrorWidget.showError(context, errorMessage);
        }
      } catch (e) {
        if (context.mounted) {
          CustomErrorWidget.showError(context, 'An unexpected error occurred. Please try again.');
        }
      } finally {
        if (context.mounted) {
          LoadingIndicator.setLoading(context, false);
        }
      }
    }
  }
}
