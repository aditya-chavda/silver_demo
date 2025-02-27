import 'dart:math';

import 'package:flutter/material.dart';

class PostFooterIcon extends StatelessWidget {
  const PostFooterIcon({
    required this.icon,
    this.quantized = true,
    super.key,
  });

  final IconData icon;
  final bool quantized;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 22, color: Colors.grey.shade600),
        if (quantized) const SizedBox(width: 4),
        if (quantized)
          Text(
            Random().nextInt(480).toString(),
            style: TextStyle(color: Colors.grey.shade600),
          ),
      ],
    );
  }
}
