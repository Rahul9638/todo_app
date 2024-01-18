import 'package:flutter/material.dart';
import 'package:todo_app/modules/config/hext_to_color.dart';

class CustomTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: lightColorScheme,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromRGBO(29, 161, 242, 1),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(29, 161, 242, 1),
      ),
    );
  }

  static ColorScheme lightColorScheme = ColorScheme.light(
    primary: hexToColor('#4B52C0'),
    onPrimary: hexToColor('#FFFFFF'),
    primaryContainer: hexToColor('#E0E0FF'),
    onPrimaryContainer: hexToColor('#01006E'),
    secondary: hexToColor('#1DA1F2'),
    onSecondary: hexToColor('#EDF8FF'),
    secondaryContainer: hexToColor('E1E0F9'),
    onSecondaryContainer: hexToColor('#191A2C'),
    tertiary: hexToColor('#78536A'),
    onTertiary: hexToColor('#FFFFFF'),
    tertiaryContainer: hexToColor('#FFD8ED'),
    onTertiaryContainer: hexToColor('#2E1126'),
    error: hexToColor('#FFB4AB'),
    onError: hexToColor('##BA1A1A'),
    errorContainer: hexToColor('#FFDAD6'),
    onErrorContainer: hexToColor('#410002'),
    outline: hexToColor('#777680'),
    background: hexToColor('#FFFBFF'),
    onBackground: hexToColor('#1B1B1F'),
    surface: hexToColor('#FCF8FD'),
    onSurface: hexToColor('#1B1B1F'),
    surfaceVariant: hexToColor('#E4E1EC'),
    onSurfaceVariant: hexToColor('#46464F'),
    inverseSurface: hexToColor('#303034'),
    onInverseSurface: hexToColor('#F3EFF4'),
    inversePrimary: hexToColor('#BFC2FF'),
    shadow: hexToColor('#000000'),
    surfaceTint: hexToColor('#4B52C0'),
    outlineVariant: hexToColor('#E5E5E5'),
    scrim: hexToColor('#000000'),
  );
}
