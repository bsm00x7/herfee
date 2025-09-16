import 'dart:async';
import 'package:herfee/features/auth/domain/auth.dart';
import 'package:herfee/service/model/user_model.dart';
import '../../auth/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:provider/provider.dart';

import '../../../core/utils/loding/loding_indicator.dart';
import '../../../core/utils/success/success.dart';
import '../../../generated/l10n.dart';
import '../sign_up/controller/signUp_controller.dart';
import 'package:go_router/go_router.dart';

class ScreenOtp extends StatefulWidget {
  final String email;
  final String fullName;
  final String job;
  final String about;

  const ScreenOtp({
    super.key,
    required this.email,
    required this.fullName,
    required this.job,
    required this.about,
  });

  @override
  State<ScreenOtp> createState() => _ScreenOtpPageState();
}

class _ScreenOtpPageState extends State<ScreenOtp> {
  Timer? _timer;
  int _countdown = 60; // Initial countdown value in seconds
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _countdown = 60;
    _canResend = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _canResend = true;
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
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
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
                            email: widget.email,
                          );
                          if (context.mounted) {
                            LoadingIndicator.setLoading(context, false);
                          }

                          if (response == true) {
                            final user = AuthNotifier().user;
                            if (user != null) {
                              await SupaBaseData().insertToDataBase(
                                user: UserModel(
                                  id: user.id,
                                  imageId: '',
                                  userName: widget.fullName,
                                  jobe: widget.job,
                                  rating: '0',
                                  reviews: '0',
                                  about: widget.about,
                                  isActive: true,
                                  role: 'user',
                                  verifer_account: false,
                                ).toMap(),
                              );
                            }
                            if (context.mounted) {
                              provider
                                  .resetControllers(); // Reset controllers after successful OTP
                              context.go(
                                '/',
                              ); // Navigate to home using GoRouter
                              CustomSuccessWidget.showSuccess(
                                context,
                                s.SuccessSignup,
                              );
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 100),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _canResend && !provider.isResendEmail
                                  ? () {
                                      provider.onResendEmail(context);
                                      _startTimer(); // Restart timer after resending
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 48),
                              ),
                              child: provider.isResendEmail
                                  ? CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                      strokeWidth: 2,
                                    )
                                  : _canResend
                                  ? Text(s.ResendEmail)
                                  : Text('Resend in $_countdown s'),
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
    );
  }
}
