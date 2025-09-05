import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingCard extends StatelessWidget {
  final ThemeData theme;
  final String rating;
  final String reviwes;
  const RatingCard({super.key , required this.theme , required this.rating,required this.reviwes});




  @override
  Widget build (buildContext){
    return  Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(
            theme,
            FontAwesomeIcons.star,
            rating,
            'Rating',
            Colors.amber,
          ),
          Container(
            height: 40,
            width: 1,
            color: theme.colorScheme.outline.withValues(alpha: 0.3),
          ),
          _buildStatItem(
            theme,
            FontAwesomeIcons.comment,
           reviwes,
            'Reviews',
            theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
  Widget _buildStatItem(ThemeData theme, IconData icon, String value, String label, Color iconColor) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: FaIcon(
            icon,
            color: iconColor,
            size: 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onSurface,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

}