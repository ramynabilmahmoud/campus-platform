import 'package:flutter/material.dart';

class CustomPdfWordWidget extends StatelessWidget {
  final List<String> fileExtentions;
  final List<String> fileNames;
  final double? fileSize;
  const CustomPdfWordWidget({
    super.key,
    required this.fileExtentions,
    required this.fileNames,
    this.fileSize = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                            // color: Colors.grey.shade400,
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        width: fileSize,
                        height: fileSize,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
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
                          width: fileSize,
                          height: 20,
                          child: Center(
                              child: Text(fileName,
                                  style: const TextStyle(color: Colors.white))),
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
    );
  }
}
