import 'package:flutter/material.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';

Widget loginWithContainer({
  required String text,
  required Color textcolor,
  double? fontsize,
  FontWeight? fontWeight,
}) {
  return Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      color: primary,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
        child: customText(
            text: text,
            textcolor: textcolor,
            fontsize: fontsize ?? 15,
            fontWeight: fontWeight ?? FontWeight.bold)),
  );
}

Widget customTextField({
  required String hintText,
  required TextEditingController controller,
  Widget? suffixIcon,
  bool obscuretext = false,
}) {
  return Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      color: primary,
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextField(
      controller: controller,
      cursorColor: white,
      obscureText: obscuretext,
      style: const TextStyle(
          color: white, fontSize: 15, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
          )),
    ),
  );
}
