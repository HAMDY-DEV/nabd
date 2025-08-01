import 'package:flutter/material.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height,
    this.width,
    this.onTap,
    this.style,
    this.borderColor,
    this.borderWidth,
    this.bacColor,
    this.textColor,
    this.borderRadius,
    this.boxShadowColor,
    required this.text,
  });
  final TextStyle? style;
  final double? height;
  final double? width;
  final double? borderWidth;

  final String text;

  final Color? bacColor;
  final Color? boxShadowColor;
  final Color? borderColor;
  final Color? textColor;
  final void Function()? onTap;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? 250.w(context),
        height: height ?? 50.h(context),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? bacColor ?? AppColors.primaryColor,
            width: borderWidth ?? 1.w(context),
          ),
          boxShadow: [
            BoxShadow(
              color: boxShadowColor ?? AppColors.blackColor.withAlpha(25),
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: bacColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
        ),
        child: FittedBox(
          child: Text(
            text,
            style:
                style ??
                getTitleStyle(
                  context,
                  color: textColor ?? AppColors.whiteColor,
                ),
          ),
        ),
      ),
    );
  }
}
