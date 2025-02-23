import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliver_demo/chat_screen.dart';
import 'package:sliver_demo/login_screen.dart';
import 'package:sliver_demo/snack_screen.dart';

import 'twitter_style_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
        SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent,
              foregroundColor: Colors.white,
              minimumSize: const Size(160, 50),
            ),
          ),
        ),
        home: const SnackScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList.list(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.3),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const LoginScreen(),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const TwitterStyleProfile(
                        username: 'Aditya',
                        headerImageUrl:
                            "https://t4.ftcdn.net/jpg/02/56/10/07/360_F_256100731_qNLp6MQ3FjYtA3Freu9epjhsAj2cwU9c.jpg",
                        // 'https://media.triumphmotorcycles.co.uk/image/upload/f_auto/q_auto:eco/sitecoremedialibrary/media-library/images/motorcycles/modern-classics/t%20series/speed%20400/speed%20400%20family%20page/speed-400-my24-family-timeline-1-revised-1920x780.jpg',
                      ),
                    ),
                  ),
                  child: const Text(
                    'Profile',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ChatScreen(),
                    ),
                  ),
                  child: const Text(
                    'Chat',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
