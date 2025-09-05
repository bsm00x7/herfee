import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifierIcon extends StatelessWidget {
  final ThemeData theme;
  final bool isVerifier;

  const VerifierIcon({super.key , required this.theme , required this.isVerifier});




  @override
  Widget build (buildContext){
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isVerifier ?theme.colorScheme.primary : Colors.grey.withValues(alpha: 0.5),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.verified_rounded,
        color: theme.colorScheme.onPrimary,
        size: 16,
      ),
    );
  }
}