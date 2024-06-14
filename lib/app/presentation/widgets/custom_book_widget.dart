import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookWidget extends StatelessWidget {
  final String? bookId;
  final String? title;
  final String? description;
  final String? imageUrl;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  const CustomBookWidget({
    this.bookId,
    this.title,
    this.description,
    this.imageUrl,
    this.onTap,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 150,
        height: height ?? 150,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: imageUrl ??
                Text("Error Loading Image",
                    style: TextStyle(
                      color: Colors.red.shade300,
                    )).toString(),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
