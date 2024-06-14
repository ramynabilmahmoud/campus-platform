import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:main_platform/app/presentation/screens/library/student_library/books.dart';
import 'package:main_platform/app/presentation/widgets/custom_book_widget.dart';
import 'package:main_platform/app/presentation/widgets/custom_rating_user.dart';

@RoutePage()
class StudentPageInformation extends StatelessWidget {
  const StudentPageInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);

    final bookWidth = width * 0.5;
    final bookHeight = bookWidth * 1.1;

    List<Map<String, dynamic>> ratingUsers = [
      {
        "name": "Ramy Nabil",
        "rating": 2.5,
        "date": "May 6, 2022",
        "profilePic":
            "https://s3-alpha-sig.figma.com/img/97c6/9eac/65db0ca9d7a8763b37b3adce3a395a74?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=keubmNyZsqCrY6hzNZk9YVDBa4dVx9x~WvOVkZGGhHuNC6-upm5yWRXe57Ip306je3JPpWz~2232LHjdhZKRVSEyK~SDFHShr9SIRizL8T~2oSbTMlvZLeD1XZkh4GScObBJcLgGbt5Og-St28oBmWlOM16f4rI69966S8ZalhU39LG09dmF4wdOiTWEtzzuQjwuJe9a3U7sKgczVvYVfVhX8IB9xFiYjvmO2biwT1syZeHfK-4oK1jxH26nC1IjENoKwJ6a8g5nYpl3QFQV1pn8BnlCL4bpwMVxfrFcnzC3e0J5qSwk0jQBXKtadjbsriONKxJMyZ~CRQclyxnBBA__",
      },
      {
        "name": "Mario Melad",
        "rating": 3.5,
        "date": "May 10, 2024",
        "profilePic":
            "https://s3-alpha-sig.figma.com/img/7e0a/4618/49e6216e9713d50232154ad88f669eea?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=UfODhHkHfSSF60pttm1CnhqZykzin1Az1RLGNmUCsFoQaPZsBlfTPExJYGslo8rlsqlJCDr5tpzGHN~KHyT4YAIkvA2FhN30QbWzsUEh-SXpFZRTMbFJevqf1gFqI1R0pjk2x7dUiPxYUrk5GsyXoyrs6Pn0vQJHD6-IJmYIUG~yxiFrmBigbnQg8T728rKsF-BlDj7YiRhUM7kJYj9uUf1po69852SXLgYTXYsHBKZdt6KnqVgEqRHUCCBQF8CSGv8frbAixVWmcrqX7n89n9ICJX7oMUxG9fT5Mr1OeWxq6jHjK2y2XHmz9tD9GHoS4mO8Oy6aP50a2ZVg1Z-sqw__"
      },
      {
        "name": "Omar Ashraf",
        "rating": 5.0,
        "date": "May 22, 2020",
        "profilePic":
            "https://media-hbe1-1.cdn.whatsapp.net/v/t61.24694-24/418192757_748452800602137_8689639144483031635_n.jpg?ccb=11-4&oh=01_Q5AaIBshvlFaAH9iD9wFLo8knwheRUY8qD3-65tTS9JrOnwY&oe=6655D669&_nc_sid=e6ed6c&_nc_cat=100"
      },
      {
        "name": "Ahmed Mostafa",
        "rating": 4.5,
        "date": "Aug 20, 2023",
        "profilePic":
            "https://media-hbe1-1.cdn.whatsapp.net/v/t61.24694-24/413696353_470813785607025_6291233386092095063_n.jpg?ccb=11-4&oh=01_Q5AaIJ7vD3TQsAEi_YIAqTP7x2nHzcX1zzBteOiK366gpIzn&oe=6655F96F&_nc_sid=e6ed6c&_nc_cat=103"
      },
    ];

    double rating = 4.5;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: height * 0.3,
                child: Container(
                  width: width,
                  color: const Color(0xff3680F4),
                ),
              ),
              Positioned(
                top: height * 0.25,
                left: 0,
                right: 0,
                height: height * 0.75,
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(40),
                    ).add(
                      const BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.04,
                left: (width - bookWidth) / 2,
                right: (width - bookWidth) / 2,
                child: Column(
                  children: [
                    CustomBookWidget(
                      imageUrl: books[0]['imageUrl'],
                      width: bookWidth,
                      height: bookHeight,
                    ),
                    Text(
                      books[0]['title'],
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      books[0]['author'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: height * 0.45,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SizedBox(
                    width: width,
                    height: height * 0.5,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const Text(
                            "Learn programming fundamentals quickly with help from this hands-on tutorial. No previous experience required! Programming: A Beginner's Guide gets you started right away writing a simple but useful program in Visual Basic Express Edition",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: width * 0.92,
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey[300],
                              indent: 0,
                              endIndent: 0,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Rating",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                rating.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 30,
                                  color: Color(0xffAAFFBD),
                                ),
                              ),
                              const SizedBox(width: 20),
                              AnimatedRatingStars(
                                initialRating: 3.5,
                                minRating: 0.0,
                                maxRating: 5.0,
                                filledColor: const Color(0xffffa505),
                                emptyColor: Colors.grey,
                                filledIcon: Icons.star,
                                halfFilledIcon: Icons.star_half,
                                emptyIcon: Icons.star_border,
                                onChanged: (p0) {},
                                displayRatingValue: true,
                                interactiveTooltips: true,
                                customFilledIcon: Icons.star,
                                customHalfFilledIcon: Icons.star_half,
                                customEmptyIcon: Icons.star_border,
                                starSize: 25.0,
                                readOnly: true,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Reviews",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.92,
                            height: height * 0.16,
                            child: ListView.builder(
                              // physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(top: 0),
                              itemCount: ratingUsers.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomRatingUser(
                                    name: ratingUsers[index]['name'],
                                    rating: ratingUsers[index]['rating'],
                                    date: ratingUsers[index]['date'],
                                    profilePic: ratingUsers[index]
                                        ['profilePic'],
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 80),
                          // Center(
                          //   child: ElevatedButton(
                          //     onPressed: () {},
                          //     style: ElevatedButton.styleFrom(
                          //       backgroundColor: const Color(0xff3680F4),
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //       ),
                          //       minimumSize: Size(width * 0.6, 50),
                          //     ),
                          //     child: const Text(
                          //       "Borrow",
                          //       style: TextStyle(
                          //         fontSize: 18,
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 90,
                right: 90,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3680F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(width * 0.6, 50),
                  ),
                  child: const Text(
                    "Borrow",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
