import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class CustomDialog extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final bool dismissable;
  final List<Widget> children;
  final List<Widget>? actions;

  final CrossAxisAlignment crossAxisAlignment;

  const CustomDialog(
      {super.key,
      this.icon,
      this.title,
      required this.children,
      this.dismissable = false,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(children: [
        if (icon != null) Icon(icon),
        if (icon != null)
          const SizedBox(
            width: 10,
          ),
        if (title != null)
          Flexible(
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 24))),
          ),
      ]),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
      actions: actions,
    );
  }
}

Future showCustomDialog(
    {bool dismissable = false,
    required BuildContext context,
    required List<Widget> content,
    List<Widget>? actions,
    String? title,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    IconData? icon,
    List<SingleChildWidget>? providers}) {
  return showGeneralDialog(
      context: context,
      barrierDismissible: dismissable,
      barrierLabel: dismissable ? '' : null,
      transitionDuration: const Duration(milliseconds: 180),
      pageBuilder: (context, animation, secondaryAnimation) => Container(),
      transitionBuilder: (context, animation, secondaryAnimation, child) =>
          ScaleTransition(
            scale: Tween<double>(begin: 0.2, end: 1.0).animate(animation),
            child: FadeTransition(
                opacity: Tween<double>(begin: 0.2, end: 1.0).animate(animation),
                child: providers != null
                    ? MultiBlocProvider(
                        providers: providers,
                        child: CustomDialog(
                          actions: actions,
                          crossAxisAlignment: crossAxisAlignment,
                          title: title,
                          icon: icon,
                          children: content,
                        ),
                      )
                    : CustomDialog(
                        actions: actions,
                        crossAxisAlignment: crossAxisAlignment,
                        title: title,
                        icon: icon,
                        children: content,
                      )),
          ));
}
