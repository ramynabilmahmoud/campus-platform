import 'package:flutter/material.dart';
import 'package:main_platform/app/presentation/widgets/custom_activity_widget.dart';

class ActivitiesViewScreen extends StatelessWidget {
  const ActivitiesViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tasks = [
      "Task1",
      "Task2",
      "Task1",
      "Task2",
      "Task1",
      "Task2",
      "Task1",
      "Task2",
      "Task1",
      "Task2"
    ];

    List<String> materialNames = [
      "it essintial",
      "ccna",
      "it essintial",
      "ccna",
      "it essintial",
      "ccna",
      "it essintial",
      "ccna",
      "it essintial",
      "ccna",
    ];

    List<String> fileExtentions = [
      "PDF",
      "PDF",
      "PDF",
    ];

    List<String> fileNames = [
      "assignment",
      "assignment",
      "assignment",
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffD9D9D9),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: "Search",
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    print("filter");
                  },
                  icon: const Icon(Icons.filter_list_alt),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 8),
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              final taskName = tasks[index];
              final materialName = materialNames[index];
              return CustomActivityWidget(
                materialName: materialName,
                taskName: taskName,
                fileExtentions: fileExtentions,
                fileNames: fileNames,
              );
            },
          ),
        ),
      ],
    );
  }
}
