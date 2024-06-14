import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:main_platform/app/presentation/screens/library/student_library/books.dart';
import 'package:main_platform/app/presentation/widgets/custom_app_bar_widget.dart';
import 'package:main_platform/app/presentation/widgets/custom_book_widget.dart';
import 'package:main_platform/core/router/router.dart';

@RoutePage()
class StudentLibraryScreen extends StatefulWidget {
  const StudentLibraryScreen({super.key});

  @override
  State<StudentLibraryScreen> createState() => _StudentLibraryScreenState();
}

class _StudentLibraryScreenState extends State<StudentLibraryScreen> {
  String _searchText = '';
  List<Map<String, dynamic>> borrowedBooks = [
    {
      "bookId": "4",
      "imageUrl":
          'https://m.media-amazon.com/images/I/51fa-8F--xL._SY445_SX342_.jpg',
      "title": 'Java Programming',
      "description":
          "This book is an introduction to Java programming for beginners. It covers the basics of Java syntax, data structures, object-oriented programming, and software development methodologies. It also includes practical examples and exercises to help readers learn and apply Java programming concepts.",
      "dueDate": DateTime.now().add(const Duration(days: 3)),
      "isSubmitted": true,
    },
    {
      "bookId": "5",
      "imageUrl":
          'https://m.media-amazon.com/images/I/51E2055ZGUL._SL1000_.jpg',
      "title": 'Clean Code',
      "description":
          "This book is a guide to writing clean, readable, and maintainable code. It covers the principles and practices of clean code, including naming conventions, error handling, formatting, and testing. It also includes practical examples and exercises to help readers apply the concepts to their own code.",
      "dueDate": DateTime.now().add(const Duration(days: 5)),
      "isSubmitted": false,
    },
    {
      "bookId": "2",
      "imageUrl": 'https://m.media-amazon.com/images/I/51RXND+8SUL._SL500_.jpg',
      "title": 'Artificial Intelligence',
      "description":
          "This book provides a comprehensive overview of artificial intelligence (AI) and its applications. It covers the history of AI, the fundamental concepts and techniques, and the latest developments in the field.",
      "dueDate": DateTime.now().add(const Duration(days: 10)),
      "isSubmitted": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const name = "Ahmed Mostafa";
    const notificationCount = 5;

    // Determine if any books match the search criteria
    final bool booksFound =
        _filteredBooks.isNotEmpty || _filteredBorrowedBooks.isNotEmpty;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CustomAppBarWidget(
                notificationCount: notificationCount,
              ),
              Text(
                "Hi",
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                name,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  hintText: "Search",
                  hintStyle: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              if (booksFound)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Top Rate",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _filteredBooks.length,
                        itemBuilder: (context, index) {
                          return books[index]['Rating'] > 3
                              ? CustomBookWidget(
                                  imageUrl: _filteredBooks[index]['imageUrl'],
                                  onTap: () {
                                    context.router.navigate(
                                        const StudentRouteInformation());
                                  },
                                  width: 140,
                                  height: 140,
                                )
                              : null;
                        },
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              if (booksFound)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Recently Borrowed",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _filteredBorrowedBooks.length,
                        itemBuilder: (context, index) {
                          final book = _filteredBorrowedBooks[index];
                          final daysLeft = book['dueDate']
                                  ?.difference(DateTime.now())
                                  .inDays ??
                              0;
                          final daysLeftColor =
                              daysLeft > 5 ? Colors.green : Colors.red;
                          final isSubmted = book['isSubmitted'] == true
                              ? const Text(
                                  "Submitted",
                                  style: TextStyle(color: Colors.green),
                                )
                              : Text(
                                  '$daysLeft days left',
                                  style: TextStyle(
                                    color: daysLeftColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                          return Column(
                            children: [
                              CustomBookWidget(
                                imageUrl: _filteredBooks[index]['imageUrl'],
                                onTap: () {
                                  context.router.navigate(
                                      const StudentRouteInformation());
                                },
                                width: 120,
                                height: 160,
                              ),
                              isSubmted,
                              const SizedBox(height: 5),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              if (booksFound)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Books",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey.shade600,
                      ),
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              if (!booksFound)
                const Center(
                  child: Text(
                    "Book Not Found",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              if (booksFound)
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _filteredBooks.length,
                    itemBuilder: (context, index) {
                      return CustomBookWidget(
                        imageUrl: _filteredBooks[index]['imageUrl'],
                        onTap: () {
                          context.router
                              .navigate(const StudentRouteInformation());
                        },
                        width: 140,
                        height: 140,
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> get _filteredBooks => books
      .where((books) =>
          books["title"]!.toLowerCase().contains(_searchText.toLowerCase()))
      .toList();

  List<Map<String, dynamic>> get _filteredBorrowedBooks => borrowedBooks
      .where((books) =>
          books["title"]!.toLowerCase().contains(_searchText.toLowerCase()))
      .toList();
}
