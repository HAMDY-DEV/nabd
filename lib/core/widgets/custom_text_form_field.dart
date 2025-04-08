import 'package:flutter/material.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final bool filled;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final int? maxLins;
  final Function(String)? onChanged;
  TextInputType? keyboardType;

  CustomTextFormField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.fillColor,
    required this.filled,
    required this.obscureText,

    this.controller,
    this.validator,
    this.hintStyle,
    this.style,
    this.maxLins,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLines: maxLins,
      style:
          style ??
          getBodyStyle(
            context,
            color: AppColors.blackColor,
            fontSize: 12.sp(context),
            fontWeight: FontWeight.bold,
          ),
      controller: controller,

      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
