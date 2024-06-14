import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:main_platform/app/presentation/widgets/custom_bottom_bar.dart';
import 'package:main_platform/app/presentation/widgets/custom_navigation_widget.dart';

@RoutePage()
class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, @PathParam('id') this.courseId});

  final String? courseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomBar(
            items: navigationItems,
            currentIndex: -1,
            onItemSelected: (item) {
              context.router.navigate(item.route!);
            }),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Placeholder(),
        )));
  }
}
