import 'package:flutter/material.dart';

class ContainerMessage extends StatelessWidget {
  final Size size;
  final Color color;

  final AlignmentGeometry alignment;
  final String message;

  const ContainerMessage({
    super.key,
    required this.size,
    required this.color,
    required this.alignment,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: alignment,
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: size.width * 0.8,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.elliptical(-5, 5),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Text(
                    message,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
