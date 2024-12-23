import 'package:flutter/material.dart';

class DeGestureDetector extends StatelessWidget {
  final void Function()? onTap;
  final Widget? child;

  const DeGestureDetector({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: child,
    );
  }
}
