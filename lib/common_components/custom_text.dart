import 'package:flutter/material.dart';

Widget customText({
  required String text,
  TextAlign? alignment,
  required Color textcolor,
  FontWeight? fontWeight,
  required double fontsize,
  double? lineheight,
}) {
  return Text(
    textAlign: alignment,
    text,
    style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontsize,
        color: textcolor,
        height: lineheight),
  );
}
