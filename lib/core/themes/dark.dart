import 'package:flutter/material.dart';

const colorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff3680f4),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFDCE1FF),
  onPrimaryContainer: Color(0xFF004EE7),
  secondary: Color(0xFFFFB59C),
  onSecondary: Color(0xFF5C1A00),
  secondaryContainer: Color(0xFF7C2E0F),
  onSecondaryContainer: Color(0xFFFFDBCF),
  tertiary: Color(0xFFE3BADA),
  onTertiary: Color(0xFF432740),
  tertiaryContainer: Color(0xFF5B3D57),
  onTertiaryContainer: Color(0xFFFFD7F5),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),
  outline: Color(0xFF90909A),
  background: Color(0xFF17191D),
  onBackground: Color(0xFFE4E1E6),
  surface: Color(0xFF201F29),
  onSurface: Color(0xFFC8C6CA),
  surfaceVariant: Color(0xFF45464F),
  onSurfaceVariant: Color(0xFFC6C5D0),
  inverseSurface: Color(0xFFE4E1E6),
  onInverseSurface: Color(0xFF1B1B1F),
  inversePrimary: Color(0xFF004EE7),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFB6C4FF),
  outlineVariant: Color(0xFF45464F),
  scrim: Color(0xFF000000),
);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: 'Alexandria',
    bottomAppBarTheme: BottomAppBarTheme(
      color: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0),
    colorScheme: colorScheme);
