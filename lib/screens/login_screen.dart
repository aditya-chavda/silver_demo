import 'package:flutter/material.dart';

import '../widgets/labelled_divider.dart';
import '../widgets/login_form.dart';
import '../widgets/privacy_footer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            titleSpacing: 0,
            expandedHeight: 320,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(100),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/splash.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList.list(
              children: const [
                SizedBox(height: 32),
                Text(
                  'India\'s #1 Food Delivery and Dining App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.2,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                LabelledDivider(text: 'Login in or sign up'),
                LoginForm(),
              ],
            ),
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: PrivacyFooter(),
          ),
        ],
      ),
    );
  }
}
