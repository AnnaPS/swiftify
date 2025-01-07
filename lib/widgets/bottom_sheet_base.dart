import 'package:flutter/material.dart';

class BottomSheetBase extends StatelessWidget {
  const BottomSheetBase({
    required this.child,
    this.height,
    super.key,
  });

  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: height ?? MediaQuery.of(context).size.height * 0.3,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.surfaceTint,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: child,
        ),
      ),
    );
  }
}
