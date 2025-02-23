import 'package:flutter/material.dart';

import '../screens/twitter_style_profile.dart';
import 'circle_icon.dart';

class SnackProfile extends StatelessWidget {
  const SnackProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const Text(
                  'Blinkit in',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Text(
                  '15 minutes',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    text: 'Simform - ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                    children: [
                      TextSpan(
                        text: 'Aditya Chavda',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36),
            child: CircleIcon(
              icon: Icons.person,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const TwitterStyleProfile(
                    username: 'Aditya',
                    headerImageUrl:
                        "https://t4.ftcdn.net/jpg/02/56/10/07/360_F_256100731_qNLp6MQ3FjYtA3Freu9epjhsAj2cwU9c.jpg",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
