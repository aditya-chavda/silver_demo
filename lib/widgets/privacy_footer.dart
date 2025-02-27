import 'package:flutter/material.dart';

class PrivacyFooter extends StatelessWidget {
  const PrivacyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'By continuing, you agree to our',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Terms of Service',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            Text(
              'Privacy Policy',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            Text(
              'Content Policies',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ],
        ),
        SizedBox(height: 28),
      ],
    );
  }
}
