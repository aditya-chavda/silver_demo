import 'package:flutter/material.dart';

import '../widgets/labelled_divider.dart';
import '../widgets/login_form.dart';
import '../widgets/privacy_footer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleSpacing: 0,
            expandedHeight: 300,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(100),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/splash.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
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
                  LoginForm(),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: PrivacyFooter(),
          ),
        ],
      ),
    );
  }
}
