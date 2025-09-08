import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:slider_button/slider_button.dart';
import '../../../../generated/l10n.dart';

class BookingButton extends StatelessWidget {
  final String userName;

  const BookingButton({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Center(
      child: SliderButton(
        action: () async {
          Lottie.asset("assets/lotties/bokkinglotties.json");
          Future.delayed(Duration(seconds: 2));
        },
        label: Text(
          "Slide to Contact $userName",
          style: theme.textTheme.titleMedium,
        ),
        icon: Icon(FontAwesomeIcons.check, color: theme.colorScheme.primary),
      ),
    );
  }
}
