import 'package:flutter/material.dart';

const colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff3680f4),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFDCE1FF),
  onPrimaryContainer: Color(0xFF004EE7),
  secondary: Color(0xFF9A4524),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDBCF),
  onSecondaryContainer: Color(0xFF380C00),
  tertiary: Color(0xFF75546F),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFD7F5),
  onTertiaryContainer: Color(0xFF2C122A),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),
  outline: Color(0xFF767680),
  background: Color(0xFFFEFBFF),
  onBackground: Color(0xFF1B1B1F),
  surface: Color(0xFFEBE8EE),
  onSurface: Color(0xFF1B1B1F),
  surfaceVariant: Color(0xFFE2E1EC),
  onSurfaceVariant: Color(0xFF45464F),
  inverseSurface: Color(0xFF303034),
  onInverseSurface: Color(0xFFF2F0F4),
  inversePrimary: Color(0xFFB6C4FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFB6C4FF),
  outlineVariant: Color(0xFFC6C5D0),
  scrim: Color(0xFF000000),
);

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0),
    fontFamily: 'Alexandria',
    bottomAppBarTheme: BottomAppBarTheme(
        color: colorScheme.surface, surfaceTintColor: Colors.transparent),
    colorScheme: colorScheme);
