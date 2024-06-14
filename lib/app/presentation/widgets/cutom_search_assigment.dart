import 'package:flutter/material.dart';
import 'package:main_platform/app/presentation/widgets/custom_pdf_word_widget.dart';

class CustomSearchAssigment extends StatelessWidget {
  const CustomSearchAssigment({
    super.key,
    required this.assigment,
    required this.assigmentDescription,
    required this.drName,
    required this.inOrOutDoor,
    required this.assigmentLimitTime,
    required this.assigmentSendTimming,
    required this.fileExtentions,
    required this.fileNames,
    this.fileSize = 60,
  });

  final String assigment;
  final String drName;
  final String inOrOutDoor;
  final String assigmentLimitTime;
  final String assigmentDescription;
  final String assigmentSendTimming;
  final List<String> fileExtentions;
  final List<String> fileNames;
  final double? fileSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            assigment,
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          Text(
            drName,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(11)),
              child: Text(
                inOrOutDoor,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 10),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                assigmentLimitTime,
                style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                    fontSize: 10),
              ),
            ),
          ]),
          const SizedBox(
            height: 5,
          ),
          Text(
            assigmentDescription,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                children: [
                  CustomPdfWordWidget(
                    fileExtentions: fileExtentions,
                    fileNames: fileNames,
                    fileSize: fileSize,
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  assigmentSendTimming,
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
