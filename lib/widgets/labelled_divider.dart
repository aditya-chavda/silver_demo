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
          Expanded(child: Divider(color: Colors.grey.shade300)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(child: Divider(color: Colors.grey.shade300)),
        ],
      ),
    );
  }
}
