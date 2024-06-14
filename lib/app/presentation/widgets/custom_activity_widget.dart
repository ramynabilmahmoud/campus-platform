import 'package:flutter/material.dart';
import 'package:main_platform/app/presentation/widgets/custom_avatar_widget.dart';
import 'package:main_platform/core/cache/auth_cache.dart';
import 'package:main_platform/core/di/di.dart';

class CustomActivityWidget extends StatelessWidget {
  const CustomActivityWidget({
    super.key,
    required this.materialName,
    required this.taskName,
    required this.fileExtentions,
    required this.fileNames,
  });

  final String materialName;
  final String taskName;
  final List<String> fileExtentions;
  final List<String> fileNames;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      margin: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffdeeffe),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: CustomAvatarWidget(iconSize: 20),
                  ),
                  Expanded(
                    child: Text(
                      getIt<AuthCache>().user!.fullName.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(text: "Submitted "),
                        TextSpan(
                          text: taskName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        const TextSpan(text: " assignment for "),
                        TextSpan(
                          text: materialName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        const TextSpan(text: " course"),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...List.generate(
                      fileExtentions.length,
                      (index) {
                        final extension = fileExtentions[index];
                        final fileName = fileNames[index];
                        return GestureDetector(
                          onTap: () {
                            print(fileExtentions[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  width: 50,
                                  height: 50,
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15.0),
                                      child: Text(
                                        extension,
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 5),
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    width: 50,
                                    height: 20,
                                    child: Center(child: Text(fileName)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '04/19/2024 08:43 PM',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
