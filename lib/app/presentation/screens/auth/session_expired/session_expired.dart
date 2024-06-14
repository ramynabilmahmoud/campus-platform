import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:main_platform/core/router/router.dart';
import 'package:main_platform/core/widgets/custom_dialog_widget.dart';

@RoutePage()
class SessionExpiredScreen extends StatefulWidget {
  const SessionExpiredScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SessionExpiredScreen();
}

class _SessionExpiredScreen extends State<SessionExpiredScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 500)).then((_) =>
          showCustomDialog(context: context, title: "Session Expied", content: [
            Text("Your session has been expired, please log in to continue.")
          ], actions: [
            TextButton(
              child: Text("Log in"),
              onPressed: () => context.router.replace(LoginRoute()),
            )
          ]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
