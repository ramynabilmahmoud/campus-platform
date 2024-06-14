import 'package:flutter/material.dart';
import 'package:main_platform/app/presentation/widgets/custom_avatar_widget.dart';
import 'package:main_platform/app/presentation/widgets/custom_pdf_word_widget.dart';
import 'package:readmore/readmore.dart';

class CustomMaterialPostWidget extends StatelessWidget {
  final String name;
  final String briefTextPost;
  final String dateAndTime;
  final VoidCallback onTap;
  final List<String> fileExtentions;
  final List<String> fileNames;
  final String photoUrl;
  final double? fileSize;

  const CustomMaterialPostWidget({
    super.key,
    required this.name,
    required this.photoUrl,
    required this.dateAndTime,
    required this.briefTextPost,
    required this.onTap,
    required this.fileExtentions,
    required this.fileNames,
    this.fileSize,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  CustomAvatarWidget(
                    avatarUrl: photoUrl,
                    iconSize: 27,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        dateAndTime,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff929292),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ReadMoreText(
                briefTextPost,
                trimLines: 2,
                textAlign: TextAlign.justify,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read more',
                trimExpandedText: ' Read less',
                lessStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.blue,
                ),
                moreStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.blue,
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: fileNames.isEmpty ? 0 : 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (context, index) => CustomPdfWordWidget(
                    fileExtentions: fileExtentions,
                    fileNames: fileNames,
                    fileSize: fileSize,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: onTap,
                  child: const SizedBox(
                    width: 115,
                    child: Row(
                      children: [
                        Icon(
                          Icons.link,
                          size: 20,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Navigate to Post',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
