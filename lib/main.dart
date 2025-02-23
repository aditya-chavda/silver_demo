import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliver_demo/screens/snack_screen.dart';

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
