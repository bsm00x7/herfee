
import 'package:flutter/material.dart';

class JobTitle extends StatelessWidget {
  final ThemeData theme;
  final String jobName;
  const JobTitle({super.key , required this.theme , required this.jobName});




  @override
  Widget build (buildContext){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Text(
        jobName,
        style: theme.textTheme.titleMedium?.copyWith(
          color: theme.colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}