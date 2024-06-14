import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:main_platform/core/constants/signup_step.dart';

@RoutePage()
class StepRequiredScreen extends StatelessWidget {
  const StepRequiredScreen({super.key, required this.step});

  final SignUpStep step;

  @override
  Widget build(BuildContext context) {
    print(step);
    return const Placeholder();
  }
}
