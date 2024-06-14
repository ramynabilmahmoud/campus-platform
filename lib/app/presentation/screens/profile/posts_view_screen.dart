
import 'package:flutter/material.dart';
import 'package:main_platform/app/presentation/widgets/custom_post.dart';
import 'package:main_platform/core/cache/auth_cache.dart';
import 'package:main_platform/core/di/di.dart';

class PostsViewScreen extends StatelessWidget {
  const PostsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          CustomPost(
            postSenderName: getIt<AuthCache>().user!.fullName.toString(),
            briefTextPost: "Hello uni",
            postTime: "24/04/2024 06:54",
          ),
          CustomPost(
              postSenderName: getIt<AuthCache>().user!.fullName.toString(),
              briefTextPost: "Let's rock it!",
              postTime: "24/04/2024 05:32"),
        ],
      ),
    );
  }
}
