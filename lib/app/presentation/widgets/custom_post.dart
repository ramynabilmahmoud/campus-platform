import 'package:flutter/material.dart';
import 'package:main_platform/app/presentation/widgets/custom_avatar_widget.dart';

// ignore: must_be_immutable
class CustomPost extends StatelessWidget {
  const CustomPost({
    super.key,
    required this.postSenderName,
    this.briefTextPost,
    this.postTime,
    this.photoUrl,
  });

  final String postSenderName;
  final String? briefTextPost;
  final String? postTime;
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(1, 1),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
        color: Colors.white,
        border: Border.all(
          width: 0.5,
          color: Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAvatarWidget(
            avatarUrl: photoUrl ?? '',
            iconSize: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  postSenderName,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  postTime ?? '00:00',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  briefTextPost ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
