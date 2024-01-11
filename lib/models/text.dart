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

  final String text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  TextAlign? textAlign;
  double? height;
  TextOverflow? overflow;
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
