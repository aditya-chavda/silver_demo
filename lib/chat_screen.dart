import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const data = [
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Hey! How's your day going?",
    "msg_timestamp": "2025-02-18T10:00:00Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Hey John! It's been great. Just got back from the gym.",
    "msg_timestamp": "2025-02-18T10:01:15Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Nice! Feeling energized?",
    "msg_timestamp": "2025-02-18T10:02:30Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Yeah, but also super hungry now!",
    "msg_timestamp": "2025-02-18T10:03:45Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Haha, what’s for lunch?",
    "msg_timestamp": "2025-02-18T10:05:00Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Thinking of making a sandwich. You?",
    "msg_timestamp": "2025-02-18T10:06:10Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Probably ordering a burger. Feeling lazy!",
    "msg_timestamp": "2025-02-18T10:07:25Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Haha, must be a chill day then?",
    "msg_timestamp": "2025-02-18T10:08:40Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Yep! Watching some Netflix too.",
    "msg_timestamp": "2025-02-18T10:10:00Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "What are you watching?",
    "msg_timestamp": "2025-02-18T10:11:20Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Stranger Things, finally catching up!",
    "msg_timestamp": "2025-02-18T10:12:35Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Omg, it’s so good! Which episode?",
    "msg_timestamp": "2025-02-18T10:13:50Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Season 3, Episode 5!",
    "msg_timestamp": "2025-02-18T10:15:05Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Oh, things are about to get intense!",
    "msg_timestamp": "2025-02-18T10:16:20Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "No spoilers please! Haha.",
    "msg_timestamp": "2025-02-18T10:17:35Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Haha, I promise! Enjoy it!",
    "msg_timestamp": "2025-02-18T10:18:50Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Thanks! What are you up to later?",
    "msg_timestamp": "2025-02-18T10:20:00Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Maybe going out for coffee with a friend.",
    "msg_timestamp": "2025-02-18T10:21:15Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Sounds nice! Which place?",
    "msg_timestamp": "2025-02-18T10:22:30Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Probably the new cafe downtown!",
    "msg_timestamp": "2025-02-18T10:23:45Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Oh, I heard it's great! Let me know how it is.",
    "msg_timestamp": "2025-02-18T10:25:00Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Will do!",
    "msg_timestamp": "2025-02-18T10:26:15Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "For the record, I love Italian food.",
    "msg_timestamp": "2025-02-18T10:10:00Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Me too! Especially pasta.",
    "msg_timestamp": "2025-02-18T10:11:20Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Same! What's your favorite type?",
    "msg_timestamp": "2025-02-18T10:12:35Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "I love carbonara. You?",
    "msg_timestamp": "2025-02-18T10:13:50Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Alfredo for me!",
    "msg_timestamp": "2025-02-18T10:15:05Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Good choice! We should grab pasta sometime.",
    "msg_timestamp": "2025-02-18T10:16:20Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Definitely! Let’s plan soon.",
    "msg_timestamp": "2025-02-18T10:17:35Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Sure! I'll let you know when I'm free.",
    "msg_timestamp": "2025-02-18T10:18:50Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Sounds good!",
    "msg_timestamp": "2025-02-18T10:20:00Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Catch up later?",
    "msg_timestamp": "2025-02-18T10:26:15Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "For sure! Have fun!",
    "msg_timestamp": "2025-02-18T10:27:30Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Thanks! Bye.",
    "msg_timestamp": "2025-02-18T10:26:15Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Bbye!",
    "msg_timestamp": "2025-02-18T10:27:30Z"
  },
];

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  static const _todayKey = ValueKey('TodayMarker');

  final scrollController = ScrollController();

  var isLoading = '';

  var pastData = <Map>[];
  final currentData = data.sublist(10, 21);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.blue,
        title: Row(
          children: [
            CircleAvatar(
              radius: 22,
              foregroundImage: Image.network(
                data[1]['profile_pic_url'].toString(),
              ).image,
            ),
            const SizedBox(width: 12),
            Text(data[1]['name'].toString()),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: NotificationListener<ScrollEndNotification>(
          onNotification: (notification) {
            // Note, this will listen to only immediate scroll events.
            if (notification.depth == 0) {
              // Only if we're dragging in that direction will we try to load in
              // more items.
              final primaryVelocity =
                  notification.dragDetails?.primaryVelocity ?? 0;

              if (notification.metrics.extentBefore == 0) {
                _loadBefore(-40);
              }

              if (notification.metrics.extentAfter == 0) {
                _loadAfter(notification.metrics.maxScrollExtent + 40);
              }
            }

            return false;
          },
          child: CustomScrollView(
            controller: scrollController,
            center: _todayKey,
            slivers: [
              // ParallaxSliver(
              //   parallaxFactor: 0.8,
              //   child: Image.network(
              //     'https://www.dictionary.com/e/wp-content/uploads/2019/09/1000x700_peek_pique_peak-790x310.jpg',
              //     height: 300,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              if (isLoading == 'before')
                const SliverToBoxAdapter(
                  child: CupertinoActivityIndicator(
                    radius: 15,
                    color: Colors.black,
                  ),
                )
              else if (pastData.isNotEmpty)
                MessageView(data: pastData, reverse: true),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              const SliverToBoxAdapter(
                key: _todayKey,
                child: Align(
                  child: Text(
                    'Today',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              MessageView(data: currentData),
              if (isLoading == 'after') ...[
                const SliverPadding(
                  padding: EdgeInsets.only(top: 10),
                  sliver: SliverToBoxAdapter(
                    child: CupertinoActivityIndicator(
                      radius: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
              const SliverToBoxAdapter(child: SizedBox(height: 30)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loadBefore(double offset) async {
    if (isLoading.isNotEmpty || pastData.isNotEmpty) return;
    setState(() => isLoading = 'before');
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    });
    await Future.delayed(const Duration(seconds: 2));
    pastData = data.sublist(0, 10);
    setState(() => isLoading = '');
  }

  Future<void> _loadAfter(double offset) async {
    if (isLoading.isNotEmpty || currentData.length > 12) return;
    setState(() => isLoading = 'after');
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    });
    await Future.delayed(const Duration(seconds: 2));
    currentData.addAll(data.sublist(21));
    setState(() => isLoading = '');
  }
}

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
    ListView;
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
                color: isSender ? Colors.blue : Colors.grey.shade200,
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
