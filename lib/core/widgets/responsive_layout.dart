import "package:flutter/widgets.dart";
import 'package:main_platform/core/utils/screen_helper.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget? mobileWidget;

  final Widget? webWidget;

  final Widget? tabletWidget;

  final Widget? portraitWidget;

  final Widget? landscapeWidget;

  final Widget defaultWidget;

  const ResponsiveLayout(
      {super.key,
      required this.defaultWidget,
      this.mobileWidget,
      this.webWidget,
      this.tabletWidget,
      this.portraitWidget,
      this.landscapeWidget});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (ScreenHelper.isPortrait(constraints) && portraitWidget != null) {
          return portraitWidget!;
        } else if (ScreenHelper.isLandscape(constraints) &&
            landscapeWidget != null) {
          return landscapeWidget!;
        } else if (ScreenHelper.isMobile(constraints) &&
            (mobileWidget != null || portraitWidget != null)) {
          return mobileWidget ?? portraitWidget!;
        } else if (ScreenHelper.isTablet(constraints) &&
            (tabletWidget != null || portraitWidget != null)) {
          return tabletWidget ?? portraitWidget!;
        } else if (ScreenHelper.isDesktop(constraints) &&
            (webWidget != null || landscapeWidget != null)) {
          return webWidget ?? landscapeWidget!;
        }
        return defaultWidget;
      },
    );
  }
}
