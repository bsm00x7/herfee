import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: theme.appBarTheme.foregroundColor,
        backgroundColor: theme.appBarTheme.backgroundColor,
        iconTheme: theme.appBarTheme.iconTheme,
        actionsIconTheme: theme.appBarTheme.actionsIconTheme,
        elevation: theme.appBarTheme.elevation,
        surfaceTintColor: Colors.transparent,
        title: Text(s.Search, style: theme.textTheme.headlineLarge),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(children: [
            const SizedBox(height: 20),
            SearchBar()
          ]),
        ),
      ),
    );
  }
}
