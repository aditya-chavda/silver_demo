import 'dart:math';

import 'package:flutter/material.dart';

class SnackHeader extends StatelessWidget {
  const SnackHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, size: 26),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Search "chocolates"',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  width: 28,
                  child: Transform.rotate(
                    angle: pi * 0.5,
                    child: Divider(color: Colors.grey.shade300),
                  ),
                ),
                const Icon(Icons.mic, size: 28),
              ],
            ),
          ),
          SizedBox(
            height: 64,
            child: ListView.separated(
              itemCount: 8,
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => const SizedBox(width: 32),
              itemBuilder: (_, __) => const Column(
                children: [
                  Icon(Icons.headphones_outlined, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'Electronics',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
