import 'package:flutter/material.dart';

class PrivacyFooter extends StatelessWidget {
  const PrivacyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'By continuing, you agree to our',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Terms of Service'),
              Text('Privacy Policy'),
              Text('Content Policies'),
            ],
          ),
        ],
      ),
    );
  }
}
