import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.Profile, style: theme.textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w500)),
      ),
    );
  }
}
