import 'package:flutter/material.dart';

class DeProgressIndicator extends StatelessWidget {
  const DeProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive();
  }
}
