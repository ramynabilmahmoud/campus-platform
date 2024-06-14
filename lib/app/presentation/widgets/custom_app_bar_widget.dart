import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  final int notificationCount;
  const CustomAppBarWidget({
    super.key,
    required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    String logoAppbarPath = 'assets/images/brand/splash.png';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: Image.asset(
            logoAppbarPath,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10, top: 10),
          child: IconButton(
            icon: Badge(
              label: notificationCount > 0 ? Text('$notificationCount') : null,
              child: const Icon(
                Icons.notifications,
                color: Colors.black,
                size: 35,
              ),
            ),
            onPressed: () {
              print('$notificationCount notifications');
            },
          ),
        ),
      ],
    );
  }
}
