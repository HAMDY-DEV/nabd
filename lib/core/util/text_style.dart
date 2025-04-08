import 'package:flutter/material.dart';
import 'package:nabd/core/functions/isArabic.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nabd/core/util/responsive_layout.dart';

TextStyle getTitleStyle(
  context, {
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  double? height,
  double? letterSpacing,
  String? fontFamily,
}) {
  var modeTheme = Theme.of(context).colorScheme.onSurface;
  return TextStyle(
    //  fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: fontSize ?? 16.sp(context),
    height: height ?? 0,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? modeTheme,
    letterSpacing: letterSpacing,
    fontFamily:
        isArabic()
            ? GoogleFonts.cairo().fontFamily
            : fontFamily ?? GoogleFonts.sourceSans3().fontFamily,
  );
}

TextStyle getBodyStyle(
  context, {
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  double? height,
  double? letterSpacing,
  String? fontFamily,
}) {
  var modeTheme = Theme.of(context).colorScheme.onSurface;
  return TextStyle(
    fontSize: fontSize ?? 14.sp(context),
    // fontFamily: GoogleFonts.poppins().fontFamily,
    fontWeight: fontWeight ?? FontWeight.normal,
    height: height ?? 0,
    color: color ?? modeTheme,
    letterSpacing: letterSpacing,
    fontFamily:
        isArabic()
            ? GoogleFonts.cairo().fontFamily
            : fontFamily ?? GoogleFonts.sourceSans3().fontFamily,
  );
}

TextStyle getDecorationStyle(
  context, {
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  double? height,
  String? fontFamily,
  Color? decorationColor,
  double? letterSpacing,
  double? decorationThickness,
}) {
  var modeTheme = Theme.of(context).colorScheme.onSurface;
  return TextStyle(
    height: height ?? 0,
    decoration: TextDecoration.underline,
    decorationColor:
        decorationColor ?? AppColors.greyColor, // لون الخط تحت النص
    decorationThickness: decorationThickness ?? 2, // سمك الخط تحت النص
    fontSize: fontSize ?? 14.sp(context),
    // fontFamily: GoogleFonts.poppins().fontFamily,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? modeTheme,
    letterSpacing: letterSpacing,
    fontFamily:
        isArabic()
            ? GoogleFonts.cairo().fontFamily
            : fontFamily ?? GoogleFonts.sourceSans3().fontFamily,
  );
}

TextStyle getSmallStyle(
  context, {
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  String? fontFamily,
  double? letterSpacing,
  double? height,
}) {
  var modeTheme = Theme.of(context).colorScheme.onSurface;
  return TextStyle(
    // fontFamily: GoogleFonts.poppins().fontFamily,
    height: height ?? 0,
    fontSize: fontSize ?? 10.sp(context),
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? modeTheme,
    letterSpacing: letterSpacing,
    fontFamily:
        isArabic()
            ? GoogleFonts.cairo().fontFamily
            : fontFamily ?? GoogleFonts.sourceSans3().fontFamily,
  );
}
