import 'package:flutter/material.dart';

import '../screens/snack_screen.dart';
import 'labelled_divider.dart';
import 'shadow_container.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            children: [
              ShadowContainer(
                child: Row(
                  children: [
                    Icon(Icons.flag),
                    Icon(Icons.arrow_drop_down_sharp),
                  ],
                ),
              ),
              SizedBox(width: 22),
              ShadowContainer(
                child: Row(
                  children: [
                    Text(
                      '+91',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 12),
                    SizedBox(
                      width: 210,
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter Mobile Number',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            height: 1.7,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SnackScreen()),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const LabelledDivider(text: 'or'),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ShadowContainer(
                child: Icon(
                  Icons.more_horiz_rounded,
                  size: 32,
                ),
              ),
              ShadowContainer(
                child: Icon(
                  Icons.more_horiz_rounded,
                  size: 32,
                ),
              ),
              ShadowContainer(
                child: Icon(
                  Icons.more_horiz_rounded,
                  size: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
