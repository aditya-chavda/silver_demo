import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  const MessageView({
    required this.data,
    this.reverse = false,
    super.key,
  });

  final List<Map> data;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final msg = reverse ? data[(data.length - 1) - index] : data[index];
        final name = msg['name'];
        final isSender = name == 'John Doe';
        return Align(
          alignment:
              isSender ? Alignment.centerRight : FractionalOffset.centerLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.7,
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: isSender
                    ? CupertinoColors.systemOrange.darkColor
                    : Colors.grey.shade200,
                borderRadius: const BorderRadius.all(
                  Radius.circular(28),
                ),
              ),
              child: Text(
                msg['msg_text'].toString(),
                style: TextStyle(
                  color: isSender ? Colors.white : Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
