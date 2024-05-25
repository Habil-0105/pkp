import 'package:flutter/material.dart';

/// `_AppColorPaletteLight` is collection of the app colors. It defines
/// as abstract class because we don't need to instantiate it.
abstract class _AppColorPaletteLight {
  static const Color primary = Color(0xFF6750A4);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFEADDFF);
  static const Color onPrimaryContainer = Color(0xFF21005D);
  static const Color secondary = Color(0xFF625B71);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFE8DEF8);
  static const Color onSecondaryContainer = Color(0xFF1D192B);
  static const Color tertiary = Color(0xFF7D5260);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFFFD8E4);
  static const Color onTertiaryContainer = Color(0xFF31111D);
  static const Color error = Color(0xFFB3261E);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFF9DEDC);
  static const Color onErrorContainer = Color(0xFF410E0B);
  static const Color background = Color(0xFFFFFBFE);
  static const Color onBackground = Color(0xFF1C1B1F);
  static const Color surface = Color(0xFFFFFBFE);
  static const Color onSurface = Color(0xFF1C1B1F);
  static const Color outline = Color(0xFF79747E);
  static const Color surfaceVariant = Color(0xFFE7E0EC);
  static const Color onSurfaceVariant = Color(0xFF49454F);
}

/// `ThemeExtension` template for custom colors.
///
/// For example purposes, it has all required fields from the default Material `ColorScheme`.
/// But you can add, rename and delete any fields your need.
///
///  Motivation
///
/// At the beginning, you may not know if your colors will fit into the Material `ColorScheme`,
/// but you still decided to start using `ColorScheme`, and only then realize that you need additional fields.
/// You will create `ThemeExtension` for only the additional fields, and as the result, you will have your colors
/// scattered between the `ColorScheme` and `ThemeExtension` with a few extra colors.
///
/// With this template, you can collect all fields in one place,
/// and don't worry about future changes to the Material or your design.
///
/// Or you can just quickly copy-paste this file and rename fields to your needs.
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.outline,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
  });

  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color outline;
  final Color surfaceVariant;
  final Color onSurfaceVariant;

  @override
  ThemeExtension<AppColorsExtension> copyWith({Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? outline,
    Color? surfaceVariant,
    Color? onSurfaceVariant}) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      outline: outline ?? this.outline,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
      covariant ThemeExtension<AppColorsExtension>? other,
      double t,) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
        primary: Color.lerp(primary, other.primary, t)!,
        onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
        primaryContainer: Color.lerp(
            primaryContainer, other.primaryContainer, t)!,
        onPrimaryContainer: Color.lerp(
            onPrimaryContainer, other.onPrimaryContainer, t)!,
        secondary: Color.lerp(secondary, other.secondary, t)!,
        onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
        secondaryContainer: Color.lerp(
            secondaryContainer, other.secondaryContainer, t)!,
        onSecondaryContainer: Color.lerp(
            onSecondaryContainer, other.onSecondaryContainer, t)!,
        tertiary: Color.lerp(tertiary, other.tertiary, t)!,
        onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
        tertiaryContainer: Color.lerp(
            tertiaryContainer, other.tertiaryContainer, t)!,
        onTertiaryContainer: Color.lerp(
            onTertiaryContainer, other.onTertiaryContainer, t)!,
        error: Color.lerp(error, other.error, t)!,
        onError: Color.lerp(onError, other.onErrorContainer, t)!,
        errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
        onErrorContainer: Color.lerp(
            onErrorContainer, other.onErrorContainer, t)!,
        background: Color.lerp(background, other.background, t)!,
        onBackground: Color.lerp(onBackground, other.onBackground, t)!,
        surface: Color.lerp(surface, other.surface, t)!,
        onSurface: Color.lerp(onSurface, other.onSurface, t)!,
        outline: Color.lerp(outline, other.outline, t)!,
        surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
        onSurfaceVariant: Color.lerp(
            onSurfaceVariant, other.onSurfaceVariant, t)!
    );
  }
}

class AppTheme {
  static final ThemeData light = ThemeData.light().copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: _AppColorPaletteLight.primary),
      scaffoldBackgroundColor: _AppColorPaletteLight.background,
      extensions: [_lightAppColors],
      appBarTheme: const AppBarTheme(color: _AppColorPaletteLight.background),
  );

  static final AppColorsExtension _lightAppColors = AppColorsExtension(
      primary: _AppColorPaletteLight.primary,
      onPrimary: _AppColorPaletteLight.onPrimary,
      primaryContainer: _AppColorPaletteLight.primaryContainer,
      onPrimaryContainer: _AppColorPaletteLight.onPrimaryContainer,
      secondary: _AppColorPaletteLight.secondary,
      onSecondary: _AppColorPaletteLight.onSecondary,
      secondaryContainer: _AppColorPaletteLight.secondaryContainer,
      onSecondaryContainer: _AppColorPaletteLight.onSecondaryContainer,
      tertiary: _AppColorPaletteLight.tertiary,
      onTertiary: _AppColorPaletteLight.onTertiary,
      tertiaryContainer: _AppColorPaletteLight.tertiaryContainer,
      onTertiaryContainer: _AppColorPaletteLight.onTertiaryContainer,
      error: _AppColorPaletteLight.error,
      onError: _AppColorPaletteLight.onError,
      errorContainer: _AppColorPaletteLight.errorContainer,
      onErrorContainer: _AppColorPaletteLight.onErrorContainer,
      background: _AppColorPaletteLight.background,
      onBackground: _AppColorPaletteLight.onBackground,
      surface: _AppColorPaletteLight.surface,
      onSurface: _AppColorPaletteLight.onSurface,
      outline: _AppColorPaletteLight.outline,
      surfaceVariant: _AppColorPaletteLight.surfaceVariant,
      onSurfaceVariant: _AppColorPaletteLight.onSurfaceVariant
  );
}