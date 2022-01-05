import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BorderedText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? borderColor;
  final BorderRadiusGeometry? borderRadius;
  final MainAxisAlignment? alignment;

  const BorderedText(
    this.text, {
    this.fontSize,
    this.borderColor,
    this.borderRadius,
    this.alignment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment ?? MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: borderRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: SelectableText(
              text,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
      ],
    );
  }
}
