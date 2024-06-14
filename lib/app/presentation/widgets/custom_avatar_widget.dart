import 'package:flutter/material.dart';

class CustomAvatarWidget extends StatelessWidget {
  const CustomAvatarWidget(
      {super.key, this.avatarUrl, this.iconSize = 30, this.borderRadius});

  final String? avatarUrl;
  final BorderRadius? borderRadius;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(iconSize * 2),
        child: SizedBox(
            width: iconSize,
            height: iconSize,
            child: avatarUrl != null && avatarUrl!.isNotEmpty
                ? Image.network(avatarUrl!)
                : Image.asset('assets/images/avatar.png')));
  }
}
