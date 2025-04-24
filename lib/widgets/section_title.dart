import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.name,
    this.showShadow = false,
    super.key,
  });

  final String name;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 2),
          alignment: Alignment.centerLeft,
          decoration: !showShadow
              ? null
              : const BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(
                      color: CupertinoColors.systemGrey3,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
