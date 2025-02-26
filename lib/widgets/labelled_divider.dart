import 'package:flutter/material.dart';

class LabelledDivider extends StatelessWidget {
  const LabelledDivider({
    required this.text,
    this.margin = const EdgeInsets.symmetric(vertical: 20),
    super.key,
  });

  final String text;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Row(
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
