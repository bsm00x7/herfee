import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:herfee/features/screen/signin/SignInPage.dart';

import 'package:provider/provider.dart';

import '../../../core/utils/loding/loding_indicator.dart';
import '../../../core/utils/success/success.dart';
import '../../../generated/l10n.dart';
import '../sign_up/controller/signUp_controller.dart';

class ScreenOtp extends StatefulWidget {
  const ScreenOtp({super.key});

  @override
  State<ScreenOtp> createState() => _ScreenOtpPageState();
}

class _ScreenOtpPageState extends State<ScreenOtp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) => SignUpController(),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Consumer<SignUpController>(
          builder: (context, provider, child) {
            return SafeArea(
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.mark_email_unread,
                          color: Colors.blue,
                          size: 64,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          s.ConfirmYourEmail,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          s.ConfirmationCode,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          provider.controllerEmail.text,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 32),
                        OtpTextField(
                          numberOfFields: 6,
                          borderColor: const Color(0xFF512DA8),
                          showFieldAsBox: true,
                          onSubmit: (String verificationCode) async {
                            LoadingIndicator.setLoading(context);
                            final response = await provider.onCheckConfirmation(
                              verificationCode,
                              context,
                            );
                            LoadingIndicator.setLoading(context, false);
                            if (response == true) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(),
                                ),
                                (route) => false,
                              );
                              CustomSuccessWidget.showSuccess(context, s.SuccessSignup);

                            }
                          },
                        ),
                        const SizedBox(height: 100),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  provider.onResendEmail(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(0, 48),
                                ),
                                child: !provider.isResendEmail
                                    ? Text(s.ResendEmail)
                                    : CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                        strokeWidth: 2,
                                      ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
