import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:main_platform/app/presentation/widgets/custom_navigation_widget.dart';
@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget();
  }
}
