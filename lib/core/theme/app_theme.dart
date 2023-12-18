import 'package:eshop/core/constant/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    // brightness: Brightness.light,
    // primaryColor: kLightPrimaryColor,
    // visualDensity: VisualDensity.adaptivePlatformDensity,
    // scaffoldBackgroundColor: kBackgroundColor,
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.white,
    //   foregroundColor: kLightSecondaryColor,
    //   elevation: 0,
    // ),
    // textButtonTheme: TextButtonThemeData(
    //     style: TextButton.styleFrom(foregroundColor: kLightSecondaryColor)),
    // colorScheme: ColorScheme.light(secondary: kLightSecondaryColor)
    //     .copyWith(background: kLightBackgroundColor),
    colorScheme: lightColorScheme,
    useMaterial3: true,
  );

  static final darkTheme = ThemeData(
      // brightness: Brightness.dark,
      // primaryColor: kDarkPrimaryColor,
      // visualDensity: VisualDensity.adaptivePlatformDensity,
      // textButtonTheme: TextButtonThemeData(
      //     style: TextButton.styleFrom(foregroundColor: kDarkAccentColor)),
      // colorScheme: ColorScheme.light(secondary: kDarkAccentColor)
      //     .copyWith(background: kDarkBackgroundColor),
    useMaterial3: true,
    colorScheme: darkColorScheme,
  );

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006494),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFCBE6FF),
    onPrimaryContainer: Color(0xFF001E30),
    secondary: Color(0xFF50606F),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD3E4F6),
    onSecondaryContainer: Color(0xFF0C1D29),
    tertiary: Color(0xFF65587B),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFEBDCFF),
    onTertiaryContainer: Color(0xFF211634),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFCFCFF),
    onBackground: Color(0xFF1A1C1E),
    surface: Color(0xFFFCFCFF),
    onSurface: Color(0xFF1A1C1E),
    surfaceVariant: Color(0xFFDDE3EA),
    onSurfaceVariant: Color(0xFF41474D),
    outline: Color(0xFF72787E),
    onInverseSurface: Color(0xFFF0F0F3),
    inverseSurface: Color(0xFF2E3133),
    inversePrimary: Color(0xFF8ECDFF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006494),
    outlineVariant: Color(0xFFC1C7CE),
    scrim: Color(0xFF000000),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF0087FA),
    onPrimary: Color(0xFF00344F),
    primaryContainer: Color(0xFF004B71),
    onPrimaryContainer: Color(0xFFCBE6FF),
    secondary: Color(0xFFB8C8D9),
    onSecondary: Color(0xFF22323F),
    secondaryContainer: Color(0xFF394956),
    onSecondaryContainer: Color(0xFFD3E4F6),
    tertiary: Color(0xFFD0C0E8),
    onTertiary: Color(0xFF362B4A),
    tertiaryContainer: Color(0xFF4D4162),
    onTertiaryContainer: Color(0xFFEBDCFF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1A1C1E),
    onBackground: Color(0xFFE2E2E5),
    surface: Color(0xFF1A1C1E),
    onSurface: Color(0xFFE2E2E5),
    surfaceVariant: Color(0xFF41474D),
    onSurfaceVariant: Color(0xFFC1C7CE),
    outline: Color(0xFF8B9198),
    onInverseSurface: Color(0xFF1A1C1E),
    inverseSurface: Color(0xFFE2E2E5),
    inversePrimary: Color(0xFF006494),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF8ECDFF),
    outlineVariant: Color(0xFF41474D),
    scrim: Color(0xFF000000),
  );


}
