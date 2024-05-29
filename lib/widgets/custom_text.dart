import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final Color? color;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.color,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
    this.overflow = TextOverflow.clip,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style:
          TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: color),
      overflow: overflow,
    );
  }
}
