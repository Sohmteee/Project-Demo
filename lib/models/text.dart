import 'package:flutter/material.dart';

class DMSansText extends StatelessWidget {
   DMSansText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
  });

  final String text;
  double? fontSize;
  FontWeight? fontWeight;

  Color? color;

  TextAlign? textAlign;

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
      ),
    );
  }
}
