import 'package:flutter/material.dart';
import 'package:main_platform/app/presentation/screens/profile/communities_view_screen.dart';
import 'package:main_platform/app/presentation/widgets/custom_tag_widget.dart';

class CustomCommunitiesWidget extends StatelessWidget {
  const CustomCommunitiesWidget(
      {super.key,
      required this.communityName,
      this.image =
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwpLNV6u_MFG2KQdNRfVKX56wBrKz33vG9ToAKxDa84A&s'});
  final String image;
  final String communityName;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(11),
            color: const Color(0XFFDEEFFE),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(2, 2),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: IntrinsicHeight(
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    child: Image.network(
                      width: 120,
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: currentWidth,
                            child: Text(
                              communityName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: currentWidth,
                            child: const Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: [
                                CustomTagWidget(
                                  tagText: 'ICT',
                                  tagColor: Color(0XFFF5BE33),
                                ),
                                CustomTagWidget(
                                  tagText: 'First Year',
                                  tagColor: Color(0XFFDD8181),
                                ),
                                CustomTagWidget(
                                  tagText: 'Second Semester',
                                  tagColor: Color(0XFF36F449),
                                ),
                                CustomTagWidget(
                                  tagText: 'Section 1',
                                  tagColor: Color.fromARGB(255, 74, 0, 170),
                                ),
                                CustomTagWidget(
                                  tagText: 'Lecture',
                                  tagColor: Color.fromARGB(255, 14, 27, 214),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0XFF3680F4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              minimumSize: const Size(double.infinity, 40),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const CommunitiesViewScreen(),
                              ));
                            },
                            child: const Text(
                              'View Community',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
