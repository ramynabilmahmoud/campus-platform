import 'package:flutter/material.dart';

class AvatarStackWidget extends StatelessWidget {
  const AvatarStackWidget({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
          children: List.generate(
              children.length,
              (index) => Positioned(
                  left: (index * (1 - .4) * 40).toDouble(),
                  top: 0,
                  child: children[index]))),
    );
  }
}
