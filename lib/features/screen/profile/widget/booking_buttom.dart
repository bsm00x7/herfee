import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../../service/model/user_model.dart';
import '../../chat/conatct_user.dart';

class BookingButton extends StatelessWidget {
  final UserModel user;
  const BookingButton({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FloatingActionButton.extended(
        elevation: 1,
        onPressed: () async {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(
              child: Lottie.asset(
                Assets.lottiesBookingLotties,
                repeat: false,
                onLoaded: (composition) async {
                  await Future.delayed(composition.duration);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          );
          if (context.mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ContactUser(user: user);
                },
              ),
            );
          }
        },
        foregroundColor: Colors.white,
        backgroundColor: theme.colorScheme.primary,
        label: Text(
          " ${s.ClikeToContact} ${user.userName}",
          style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
