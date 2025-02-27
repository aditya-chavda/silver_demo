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
          Row(
            children: [
              ShadowContainer(
                padding: const EdgeInsets.fromLTRB(12, 8, 0, 8),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 22,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2016/08/24/17/07/india-1617463_640.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_sharp,
                      color: Colors.grey,
                      size: 42,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 22),
              const ShadowContainer(
                padding: EdgeInsets.all(16),
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
                      width: 180,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShadowContainer(
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/2048px-Google_%22G%22_logo.svg.png',
                  width: 32,
                  height: 32,
                ),
              ),
              ShadowContainer(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 4,
                ),
                child: Image.network(
                  'https://i.pinimg.com/736x/24/13/3a/24133a0cfbc054db31c9ac97c64ea727.jpg',
                  fit: BoxFit.cover,
                  width: 52,
                  height: 32,
                ),
              ),
              const ShadowContainer(
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
