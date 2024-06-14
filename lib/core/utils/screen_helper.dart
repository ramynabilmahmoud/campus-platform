import 'package:flutter/widgets.dart';

class ScreenHelper {
  static bool isMobile(BoxConstraints constraint) {
    return constraint.maxWidth < 600;
  }

  static bool isTablet(BoxConstraints constraint) {
    return constraint.maxWidth >= 600 && constraint.maxWidth < 900;
  }

  static bool isDesktop(BoxConstraints constraint) {
    return constraint.maxWidth >= 900;
  }

  static bool isPortrait(BoxConstraints constraint) {
    return constraint.maxWidth < constraint.maxHeight;
  }

  static bool isLandscape(BoxConstraints constraint) => !isPortrait(constraint);

  static bool isTabletOrMobile(BoxConstraints constraint) =>
      isMobile(constraint) || isTablet(constraint);
}
