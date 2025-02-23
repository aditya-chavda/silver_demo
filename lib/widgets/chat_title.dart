import 'package:flutter/material.dart';

import '../static_data.dart';

class ChatTitle extends StatelessWidget {
  const ChatTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          foregroundImage: Image.network(
            chatData[1]['profile_pic_url'].toString(),
          ).image,
        ),
        const SizedBox(width: 12),
        Text(chatData[1]['name'].toString()),
      ],
    );
  }
}
