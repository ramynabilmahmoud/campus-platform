import 'package:flutter/material.dart';

class CustomTagWidget extends StatelessWidget {
  const CustomTagWidget({
    super.key,
    required this.tagText,
    required this.tagColor,
  });

  final String tagText;
  final Color? tagColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: tagColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          tagText,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontFamily: 'Archivo',
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
      onTap: () {
        print(tagText);
      },
    );
  }
}
