import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String bName;
  final Color? bColor;
  final VoidCallback callback;

  const PrimaryButton(
      {super.key, required this.bName, this.bColor, required this.callback});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callback,
      child: Text(bName),
    );
  }
}
