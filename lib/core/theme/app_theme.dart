import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff37618e),
      surfaceTint: Color(0xff37618e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd2e4ff),
      onPrimaryContainer: Color(0xff1c4975),
      secondary: Color(0xff236488),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc8e6ff),
      onSecondaryContainer: Color(0xff004c6d),
      tertiary: Color(0xff7a590c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdea5),
      onTertiaryContainer: Color(0xff5d4200),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff191c20),
      onSurfaceVariant: Color(0xff43474e),
      outline: Color(0xff73777f),
      outlineVariant: Color(0xffc3c6cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3135),
      inversePrimary: Color(0xffa2c9fd),
      primaryFixed: Color(0xffd2e4ff),
      onPrimaryFixed: Color(0xff001c37),
      primaryFixedDim: Color(0xffa2c9fd),
      onPrimaryFixedVariant: Color(0xff1c4975),
      secondaryFixed: Color(0xffc8e6ff),
      onSecondaryFixed: Color(0xff001e2e),
      secondaryFixedDim: Color(0xff93cdf6),
      onSecondaryFixedVariant: Color(0xff004c6d),
      tertiaryFixed: Color(0xffffdea5),
      onTertiaryFixed: Color(0xff261900),
      tertiaryFixedDim: Color(0xffecc06c),
      onTertiaryFixedVariant: Color(0xff5d4200),
      surfaceDim: Color(0xffd8dae0),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fa),
      surfaceContainer: Color(0xffeceef4),
      surfaceContainerHigh: Color(0xffe7e8ee),
      surfaceContainerHighest: Color(0xffe1e2e8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003863),
      surfaceTint: Color(0xff37618e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff476f9e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003a55),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff367398),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff483200),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8a671c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff0e1116),
      onSurfaceVariant: Color(0xff32363d),
      outline: Color(0xff4e535a),
      outlineVariant: Color(0xff696d75),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3135),
      inversePrimary: Color(0xffa2c9fd),
      primaryFixed: Color(0xff476f9e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff2d5784),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff367398),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff145a7e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8a671c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6f4f01),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc5c6cc),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fa),
      surfaceContainer: Color(0xffe7e8ee),
      surfaceContainerHigh: Color(0xffdbdde3),
      surfaceContainerHighest: Color(0xffd0d1d7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002d53),
      surfaceTint: Color(0xff37618e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1f4b78),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003046),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff004e70),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3b2900),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff604400),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff282c33),
      outlineVariant: Color(0xff454951),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3135),
      inversePrimary: Color(0xffa2c9fd),
      primaryFixed: Color(0xff1f4b78),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00345d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff004e70),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003650),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff604400),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff442f00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb7b9bf),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff0f7),
      surfaceContainer: Color(0xffe1e2e8),
      surfaceContainerHigh: Color(0xffd3d4da),
      surfaceContainerHighest: Color(0xffc5c6cc),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa2c9fd),
      surfaceTint: Color(0xffa2c9fd),
      onPrimary: Color(0xff00325a),
      primaryContainer: Color(0xff1c4975),
      onPrimaryContainer: Color(0xffd2e4ff),
      secondary: Color(0xff93cdf6),
      onSecondary: Color(0xff00344c),
      secondaryContainer: Color(0xff004c6d),
      onSecondaryContainer: Color(0xffc8e6ff),
      tertiary: Color(0xffecc06c),
      onTertiary: Color(0xff412d00),
      tertiaryContainer: Color(0xff5d4200),
      onTertiaryContainer: Color(0xffffdea5),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff111418),
      onSurface: Color(0xffe1e2e8),
      onSurfaceVariant: Color(0xffc3c6cf),
      outline: Color(0xff8d9199),
      outlineVariant: Color(0xff43474e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e8),
      inversePrimary: Color(0xff37618e),
      primaryFixed: Color(0xffd2e4ff),
      onPrimaryFixed: Color(0xff001c37),
      primaryFixedDim: Color(0xffa2c9fd),
      onPrimaryFixedVariant: Color(0xff1c4975),
      secondaryFixed: Color(0xffc8e6ff),
      onSecondaryFixed: Color(0xff001e2e),
      secondaryFixedDim: Color(0xff93cdf6),
      onSecondaryFixedVariant: Color(0xff004c6d),
      tertiaryFixed: Color(0xffffdea5),
      onTertiaryFixed: Color(0xff261900),
      tertiaryFixedDim: Color(0xffecc06c),
      onTertiaryFixedVariant: Color(0xff5d4200),
      surfaceDim: Color(0xff111418),
      surfaceBright: Color(0xff37393e),
      surfaceContainerLowest: Color(0xff0b0e13),
      surfaceContainerLow: Color(0xff191c20),
      surfaceContainer: Color(0xff1d2024),
      surfaceContainerHigh: Color(0xff272a2f),
      surfaceContainerHighest: Color(0xff32353a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc7deff),
      surfaceTint: Color(0xffa2c9fd),
      onPrimary: Color(0xff002748),
      primaryContainer: Color(0xff6c93c4),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffbae1ff),
      onSecondary: Color(0xff00293d),
      secondaryContainer: Color(0xff5c97bd),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd78d),
      onTertiary: Color(0xff332300),
      tertiaryContainer: Color(0xffb18b3d),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff111418),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd9dce5),
      outline: Color(0xffaeb2ba),
      outlineVariant: Color(0xff8c9099),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e8),
      inversePrimary: Color(0xff1d4a76),
      primaryFixed: Color(0xffd2e4ff),
      onPrimaryFixed: Color(0xff001226),
      primaryFixedDim: Color(0xffa2c9fd),
      onPrimaryFixedVariant: Color(0xff003863),
      secondaryFixed: Color(0xffc8e6ff),
      onSecondaryFixed: Color(0xff00131f),
      secondaryFixedDim: Color(0xff93cdf6),
      onSecondaryFixedVariant: Color(0xff003a55),
      tertiaryFixed: Color(0xffffdea5),
      onTertiaryFixed: Color(0xff190f00),
      tertiaryFixedDim: Color(0xffecc06c),
      onTertiaryFixedVariant: Color(0xff483200),
      surfaceDim: Color(0xff111418),
      surfaceBright: Color(0xff42454a),
      surfaceContainerLowest: Color(0xff05080b),
      surfaceContainerLow: Color(0xff1b1e22),
      surfaceContainer: Color(0xff25282d),
      surfaceContainerHigh: Color(0xff303337),
      surfaceContainerHighest: Color(0xff3b3e43),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe9f0ff),
      surfaceTint: Color(0xffa2c9fd),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff9ec5f9),
      onPrimaryContainer: Color(0xff000c1c),
      secondary: Color(0xffe3f2ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff8fc9f2),
      onSecondaryContainer: Color(0xff000d16),
      tertiary: Color(0xffffeed4),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe8bc69),
      onTertiaryContainer: Color(0xff120a00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff111418),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffedf0f9),
      outlineVariant: Color(0xffbfc3cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e8),
      inversePrimary: Color(0xff1d4a76),
      primaryFixed: Color(0xffd2e4ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa2c9fd),
      onPrimaryFixedVariant: Color(0xff001226),
      secondaryFixed: Color(0xffc8e6ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff93cdf6),
      onSecondaryFixedVariant: Color(0xff00131f),
      tertiaryFixed: Color(0xffffdea5),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffecc06c),
      onTertiaryFixedVariant: Color(0xff190f00),
      surfaceDim: Color(0xff111418),
      surfaceBright: Color(0xff4d5055),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1d2024),
      surfaceContainer: Color(0xff2e3135),
      surfaceContainerHigh: Color(0xff393b40),
      surfaceContainerHighest: Color(0xff44474c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
