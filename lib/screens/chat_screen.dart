import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../static_data.dart';
import '../widgets/chat_title.dart';
import '../widgets/message_view.dart';

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
  final currentData = chatData.sublist(10, 21);

  @override
  Widget build(BuildContext context) {
    const loader = SliverPadding(
      padding: EdgeInsets.only(top: 10),
      sliver: SliverToBoxAdapter(
        child: CupertinoActivityIndicator(
          radius: 15,
          color: Colors.black,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.orange,
        backgroundColor: Colors.white,
        title: const ChatTitle(),
      ),
      body: SafeArea(
        bottom: false,
        child: NotificationListener<ScrollEndNotification>(
          onNotification: _handlePagination,
          child: CustomScrollView(
            controller: scrollController,
            center: _todayKey,
            slivers: [
              if (isLoading == 'before')
                loader
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
              if (isLoading == 'after') loader,
              const SliverToBoxAdapter(child: SizedBox(height: 30)),
            ],
          ),
        ),
      ),
    );
  }

  bool _handlePagination(notification) {
    // Note, this will listen to only immediate scroll events.
    if (notification.depth == 0) {
      if (notification.metrics.extentBefore == 0) {
        _loadBefore(-50);
      }

      if (notification.metrics.extentAfter == 0) {
        _loadAfter(notification.metrics.maxScrollExtent + 40);
      }
    }

    return false;
  }

  Future<void> _loadBefore(double offset) async {
    if (isLoading.isNotEmpty || pastData.isNotEmpty) return;
    setState(() => isLoading = 'before');
    _scrollTo(offset);
    await Future.delayed(const Duration(seconds: 2));
    pastData = chatData.sublist(0, 10);
    setState(() => isLoading = '');
  }

  Future<void> _loadAfter(double offset) async {
    if (isLoading.isNotEmpty || currentData.length > 12) return;
    setState(() => isLoading = 'after');
    _scrollTo(offset);
    await Future.delayed(const Duration(seconds: 2));
    currentData.addAll(chatData.sublist(21));
    setState(() => isLoading = '');
  }

  void _scrollTo(double offset) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    });
  }
}
