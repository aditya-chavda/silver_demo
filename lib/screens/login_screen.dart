import 'package:flutter/material.dart';
import 'package:sliver_demo/static_data.dart';

import '../widgets/labelled_divider.dart';
import '../widgets/login_form.dart';
import '../widgets/privacy_footer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Container(
            color: Colors.white,
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(100),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/splash.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: SizedBox(height: 300, width: double.infinity),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(height: 24),
                          Text(
                            'India\'s #1 Food Delivery \nand Dining App',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              height: 1.2,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          LabelledDivider(text: 'Log in or sign up'),
                          SizedBox(height: 100),
                          LoginForm(),
                          LoginForm(),
                          LoginForm(),
                        ],
                      ),
                    ),
                  ],
                ),
                PrivacyFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
