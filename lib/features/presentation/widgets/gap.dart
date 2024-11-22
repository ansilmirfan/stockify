import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double gap;
  final bool width;

  const Gap({super.key, this.width = false, this.gap = 10});
  factory Gap.width({double gap = 10}) {
    return Gap(
      gap: gap,
      width: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (width) {
      return SizedBox(width: gap);
    } else {
      return SizedBox(height: gap);
    }
  }
}
