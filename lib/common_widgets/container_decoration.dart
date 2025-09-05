
import 'package:flutter/material.dart';
class ContainerDecoration extends StatelessWidget {
  final ThemeData theme;
  final Widget child;
  const ContainerDecoration({super.key , required this.theme , required this.child});
  @override
  Widget build (buildContext){
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primary.withOpacity(0.1),
              theme.colorScheme.surface,
              theme.colorScheme.surfaceContainer,
            ],
          ),
        ),
        child: child);
  }

}