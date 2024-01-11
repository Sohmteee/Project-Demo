// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

/// A [StatelessWidget] that displays text using the DM Sans font family.
///
/// This widget allows configuring text properties like [fontSize],
/// [fontWeight], [color], etc. It is intended for displaying text content
/// in the app using the DM Sans font.
class DMSansText extends StatelessWidget {
  DMSansText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.height,
    this.overflow,
    this.maxLines,
  });

  /// The text to display.
  final String text;

  /// The optional font size for the text.
  double? fontSize;

  /// The optional font weight for the text.
  FontWeight? fontWeight;

  /// The optional text color.
  Color? color;

  /// The optional text alignment for the text.
  TextAlign? textAlign;

  /// The optional height for the text.
  double? height;

  /// The optional text overflow behavior for the text.
  TextOverflow? overflow;

  /// The optional maximum number of lines for the text.
  /// If null, there is no limit to the number of lines.
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: 'DM Sans',
        height: height,
      ),
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}

/// A custom [Text] widget that uses the AirBnB font and style.
///
/// This widget extends [StatelessWidget] and configures a [Text] widget with
/// the AirBnB font and default text styles. It takes in a [String] for the text
/// content and allows customizing properties like [fontSize], [fontWeight],
/// [color], etc.
class AirBnBText extends StatelessWidget {
  AirBnBText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.height,
    this.overflow,
    this.maxLines,
  });

  /// The text to display.
  final String text;

  /// The optional font size for the text.
  double? fontSize;

  /// The optional font weight for the text.
  FontWeight? fontWeight;

  /// The optional text color.
  Color? color;

  /// The optional text alignment for the text.
  TextAlign? textAlign;

  /// The optional height for the text.
  double? height;

  /// The optional text overflow behavior for the text.
  TextOverflow? overflow;

  /// The optional maximum number of lines for the text.
  /// If null, there is no limit to the number of lines.
  int? maxLines;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: 'AirBnB',
        height: height,
      ),
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
