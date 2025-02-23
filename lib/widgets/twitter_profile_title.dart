import 'package:flutter/material.dart';

class TwitterProfileTitle extends StatelessWidget {
  const TwitterProfileTitle({
    required this.name,
    required this.scrollOffset,
    super.key,
  });

  final String name;
  final ValueNotifier<double> scrollOffset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const SizedBox(height: 20),
        ValueListenableBuilder(
          valueListenable: scrollOffset,
          builder: (context, offset, child) {
            return Positioned(
              bottom: (offset - 219).clamp(-150, -10),
              child: child!,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '20.4K posts',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
