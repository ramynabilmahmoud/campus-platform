import 'package:flutter/material.dart';
import 'package:main_platform/core/cache/auth_cache.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/utils/assets.dart';

class MainVerifyEmailPage extends StatelessWidget {
  const MainVerifyEmailPage({super.key, required this.onNavigate});
  final void Function() onNavigate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: onNavigate,
        child: const Icon(Icons.navigate_next_rounded),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Image.asset(Assets.path('assets/images/brand/splash.png'),
                    width: 100),
                const SizedBox(height: 30),
                Text(
                    "Before continue using our app service, you must verify your email address, by pressing the button below you will receiving an verification code to \"${getIt<AuthCache>().user!.email!}\" email address.",
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
