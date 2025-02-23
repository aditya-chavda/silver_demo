import 'dart:math';

import 'package:flutter/material.dart';

class TwitterProfileHeader extends StatelessWidget {
  const TwitterProfileHeader({
    required this.name,
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Text('@aditya_chavda'),
        const SizedBox(height: 16),
        const Text('Flutter Developer @ Simform Solutions'),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Colors.grey,
            ),
            const SizedBox(width: 4),
            const Text('Ahmedabad, GU'),
            const SizedBox(width: 20),
            Transform.rotate(
              angle: (7 * pi) / 4,
              child: const Icon(
                Icons.link_rounded,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              'simform.com',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            Icon(Icons.calendar_month_rounded, color: Colors.grey),
            SizedBox(width: 4),
            Text('Joined April 2022'),
          ],
        ),
      ],
    );
  }
}
