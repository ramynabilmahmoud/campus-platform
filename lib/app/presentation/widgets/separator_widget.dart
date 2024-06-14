import 'package:flutter/material.dart';

class SeparatorWidget extends StatelessWidget {
  final String separatorText;

  const SeparatorWidget({super.key, required this.separatorText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1)),
        Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              separatorText,
              style: const TextStyle(color: Colors.grey),
            )),
        const Expanded(child: Divider(thickness: 1)),
      ],
    );
  }
}
