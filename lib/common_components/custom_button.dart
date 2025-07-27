import 'package:flutter/material.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight? fontWeight;
  final VoidCallback onPressed;
  final Color? background;
  final double fontSize;
  final BorderRadiusGeometry? borderRadius;

  const CustomButton(
      {super.key,
      required this.text,
      required this.textColor,
      required this.onPressed,
      this.background,
      required this.fontSize,
      this.borderRadius,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0, // Set elevation to 0 to remove shadow
          backgroundColor: background ?? primary,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(30)),
        ),
        onPressed: onPressed,
        child: customText(
            text: text,
            textcolor: textColor,
            fontsize: fontSize,
            fontWeight: fontWeight ?? FontWeight.bold));
  }
}
