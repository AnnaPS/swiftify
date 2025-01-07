import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme();

  ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1a6b51),
      surfaceTint: Color(0xff1a6b51),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa6f2d2),
      onPrimaryContainer: Color(0xff002116),
      secondary: Color.fromARGB(255, 33, 59, 48),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcee9db),
      onSecondaryContainer: Color(0xff092017),
      tertiary: Color(0xff3f6375),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc2e8fd),
      onTertiaryContainer: Color(0xff001f2a),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff5fbf5),
      onSurface: Color(0xff171d1a),
      onSurfaceVariant: Color(0xff404944),
      outline: Color(0xff707974),
      outlineVariant: Color(0xffbfc9c2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c322e),
      inversePrimary: Color(0xff8ad6b7),
      primaryFixed: Color(0xffa6f2d2),
      onPrimaryFixed: Color(0xff002116),
      primaryFixedDim: Color(0xff8ad6b7),
      onPrimaryFixedVariant: Color(0xff00513c),
      secondaryFixed: Color(0xffcee9db),
      onSecondaryFixed: Color(0xff092017),
      secondaryFixedDim: Color(0xffb3ccbf),
      onSecondaryFixedVariant: Color(0xff354b42),
      tertiaryFixed: Color(0xffc2e8fd),
      onTertiaryFixed: Color(0xff001f2a),
      tertiaryFixedDim: Color(0xffa6cce0),
      onTertiaryFixedVariant: Color(0xff264b5c),
      surfaceDim: Color(0xffd6dbd6),
      surfaceBright: Color(0xfff5fbf5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f0),
      surfaceContainer: Color(0xffe9efea),
      surfaceContainerHigh: Color(0xffe4eae4),
      surfaceContainerHighest: Color(0xffdee4df),
    );
  }

  ThemeData get light {
    return theme(lightScheme());
  }

  ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00281c),
      surfaceTint: Color(0xff1a6b51),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004d38),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff10261e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff31483e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002633),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff214758),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fbf5),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1d2622),
      outline: Color(0xff3c4540),
      outlineVariant: Color(0xff3c4540),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c322e),
      inversePrimary: Color(0xffaffcdb),
      primaryFixed: Color(0xff004d38),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003425),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff31483e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1b3128),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff214758),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff043141),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd6dbd6),
      surfaceBright: Color(0xfff5fbf5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f0),
      surfaceContainer: Color(0xffe9efea),
      surfaceContainerHigh: Color(0xffe4eae4),
      surfaceContainerHighest: Color(0xffdee4df),
    );
  }

  ThemeData get lightHighContrast {
    return theme(lightHighContrastScheme());
  }

  ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff8ad6b7),
      surfaceTint: Color(0xff8ad6b7),
      onPrimary: Color(0xff003828),
      primaryContainer: Color(0xff00513c),
      onPrimaryContainer: Color(0xffa6f2d2),
      secondary: Color(0xffb3ccbf),
      onSecondary: Color(0xff1e352c),
      secondaryContainer: Color(0xff354b42),
      onSecondaryContainer: Color(0xffcee9db),
      tertiary: Color(0xffa6cce0),
      onTertiary: Color(0xff0a3545),
      tertiaryContainer: Color(0xff264b5c),
      onTertiaryContainer: Color(0xffc2e8fd),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f1512),
      onSurface: Color(0xffdee4df),
      onSurfaceVariant: Color(0xffbfc9c2),
      outline: Color(0xff89938d),
      outlineVariant: Color(0xff404944),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee4df),
      inversePrimary: Color(0xff1a6b51),
      primaryFixed: Color(0xffa6f2d2),
      onPrimaryFixed: Color(0xff002116),
      primaryFixedDim: Color(0xff8ad6b7),
      onPrimaryFixedVariant: Color(0xff00513c),
      secondaryFixed: Color(0xffcee9db),
      onSecondaryFixed: Color(0xff092017),
      secondaryFixedDim: Color(0xffb3ccbf),
      onSecondaryFixedVariant: Color(0xff354b42),
      tertiaryFixed: Color(0xffc2e8fd),
      onTertiaryFixed: Color(0xff001f2a),
      tertiaryFixedDim: Color(0xffa6cce0),
      onTertiaryFixedVariant: Color(0xff264b5c),
      surfaceDim: Color(0xff0f1512),
      surfaceBright: Color(0xff343b37),
      surfaceContainerLowest: Color(0xff0a0f0d),
      surfaceContainerLow: Color(0xff171d1a),
      surfaceContainer: Color(0xff1b211e),
      surfaceContainerHigh: Color(0xff252b28),
      surfaceContainerHighest: Color(0xff303633),
    );
  }

  ThemeData get dark {
    return theme(darkScheme());
  }

  ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffedfff4),
      surfaceTint: Color(0xff8ad6b7),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff8edabb),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffedfff4),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb7d1c3),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff7fbff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffabd0e4),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1512),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff3fdf6),
      outline: Color(0xffc3cdc6),
      outlineVariant: Color(0xffc3cdc6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee4df),
      inversePrimary: Color(0xff003123),
      primaryFixed: Color(0xffaaf7d6),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff8edabb),
      onPrimaryFixedVariant: Color(0xff001b11),
      secondaryFixed: Color(0xffd3eddf),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb7d1c3),
      onSecondaryFixedVariant: Color(0xff041a12),
      tertiaryFixed: Color(0xffcaecff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffabd0e4),
      onTertiaryFixedVariant: Color(0xff001923),
      surfaceDim: Color(0xff0f1512),
      surfaceBright: Color(0xff343b37),
      surfaceContainerLowest: Color(0xff0a0f0d),
      surfaceContainerLow: Color(0xff171d1a),
      surfaceContainer: Color(0xff1b211e),
      surfaceContainerHigh: Color(0xff252b28),
      surfaceContainerHighest: Color(0xff303633),
    );
  }

  ThemeData get darkHighContrast {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: const TextTheme().apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
      );
}