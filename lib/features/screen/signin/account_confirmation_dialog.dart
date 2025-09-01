import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
class AccountConfirmationDialog {
  /// Shows a success dialog after account creation
  static Future<void> showAccountCreatedDialog(
      BuildContext context, {
        required String email,
        VoidCallback? onContinue,
      }) async {
    if (!context.mounted) return;
    return showDialog<void>(
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
            'Account Created Successfully!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Your account has been created successfully.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Please check $email for a confirmation link to activate your account.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                onContinue?.call();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Continue to Login'),
            ),
          ],
        );
      },
    );
  }

  /// Shows bottom sheet to confirm email
  static Future<void> showBottomSheetConfirmation(
      {
        required BuildContext context,
        required String email,
        required VoidCallback onResendEmail,
        required Future<void> Function(String) onCheckConfirmation,
      }) async {
    if (!context.mounted) return;
    return showModalBottomSheet<void>(
      useSafeArea: true,
      context: context,
      isDismissible: false,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.topRight,
         children: [Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                const Icon(Icons.mark_email_unread, color: Colors.blue, size: 64),
                const SizedBox(height: 24),
                const Text(
                  'Confirm Your Email',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'We\'ve sent a confirmation Code:',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 32),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: Color(0xFF512DA8),
                  showFieldAsBox: true,

                  onCodeChanged: (String code) {
                    debugPrint('s');
                  },

                  onSubmit: (String verificationCode)=>onCheckConfirmation
                ),
                const SizedBox(height:  30),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          onResendEmail();
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 48)),
                        child: const Text('Resend Email'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),],
        );
      },
    );
  }
}