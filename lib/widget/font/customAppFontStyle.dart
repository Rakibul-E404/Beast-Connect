import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppFontStyle {
  /// Default font used throughout the app
  static TextStyle regular(
      double fontSize, [
        Color? color,
        FontWeight? fontWeight,
        FontStyle? fontStyle,
        /// Optional custom font override ===>
        String? fontFamily,
      ]) {
    return _getFont(
      fontSize,
      color,
      fontWeight ?? FontWeight.w400,
      fontStyle,
      fontFamily,
    );
  }

  static TextStyle bold(
      double fontSize, [
        Color? color,
        String? fontFamily,
      ]) {
    return _getFont(
      fontSize,
      color,
      FontWeight.bold,
      null,
      fontFamily,
    );
  }

  static TextStyle medium(
      double fontSize, [
        Color? color,
        String? fontFamily,
      ]) {
    return _getFont(
      fontSize,
      color,
      FontWeight.w500,
      null,
      fontFamily,
    );
  }

  static TextStyle light(
      double fontSize, [
        Color? color,
        String? fontFamily,
      ]) {
    return _getFont(
      fontSize,
      color,
      FontWeight.w300,
      null,
      fontFamily,
    );
  }

  static TextStyle _getFont(
      double fontSize,
      Color? color,
      FontWeight weight,
      FontStyle? fontStyle,
      String? customFontFamily,
      ) {
    if (customFontFamily != null) {
      return TextStyle(
        fontSize: fontSize,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle,
        fontFamily: customFontFamily,
      );
    }

    // Default Google Font
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: weight,
      color: color,
      fontStyle: fontStyle,
    );
  }
}
