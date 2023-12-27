// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

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
