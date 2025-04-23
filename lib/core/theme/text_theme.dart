import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(
  BuildContext context,
  String bodyFontString,
  String headlineFontString,
  String displayFontString,
) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;

  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(
    bodyFontString,
    baseTextTheme,
  );

  TextTheme headlineTextTheme = GoogleFonts.getTextTheme(
    headlineFontString,
    baseTextTheme,
  );

  TextTheme displayTextTheme = GoogleFonts.getTextTheme(
    displayFontString,
    baseTextTheme,
  );
  TextTheme textTheme = displayTextTheme.copyWith(
    headlineLarge: headlineTextTheme.headlineLarge,
    headlineMedium: headlineTextTheme.headlineMedium,
    headlineSmall: headlineTextTheme.headlineSmall,
    titleLarge: headlineTextTheme.titleLarge,
    titleMedium: headlineTextTheme.titleMedium,
    titleSmall: headlineTextTheme.titleSmall,
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}
