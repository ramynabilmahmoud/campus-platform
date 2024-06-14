import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:main_platform/app/presentation/widgets/identity_image_uploader.dart';
import 'package:main_platform/core/utils/assets.dart';

@RoutePage()
class VerifyIdentityScreen extends StatefulWidget {
  VerifyIdentityScreen({super.key});
  final GlobalKey<FormState> _identityFormKey = GlobalKey<FormState>();

  @override
  State<VerifyIdentityScreen> createState() => _VerifyIdentityScreenState();
}

class _VerifyIdentityScreenState extends State<VerifyIdentityScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: widget._identityFormKey,
            child: Column(
              children: [
                Image.asset(Assets.path('assets/images/brand/splash.png'),
                    width: 80),
                const SizedBox(height: 15),
                const Text(
                  "Verify Identity",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  "We need you to upload your personal and national identity card photos to verify that its you",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                IdentityImageUploader(
                  label: "Upload your personal photo",
                  error: null,
                ),
                const SizedBox(height: 20),
                IdentityImageUploader(
                  label: "Upload your national id card photo",
                )
              ],
            ),
          )),
    )));
  }
}
