import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:main_platform/app/presentation/screens/auth/signup/steps/verify_email/pages/main_email_page.dart';
import 'package:main_platform/app/presentation/screens/auth/signup/steps/verify_email/pages/verify_email_page.dart';

@RoutePage()
class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final _pageController = PageController(initialPage: 0, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        MainVerifyEmailPage(onNavigate: () {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceInOut);
        }),
        VerifyEmailPage(),
      ],
    );
  }
}
