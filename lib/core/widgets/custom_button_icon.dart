import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class CustomButtonIcon extends StatelessWidget {
  CustomButtonIcon({
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
    this.startIcon,
  });
  TextStyle? style;
  final double? height;
  final double? width;
  final double? borderWidth;

  final String text;
  final Color? bacColor;
  final Color? boxShadowColor;
  final Color? borderColor;
  final Color? textColor;
  void Function()? onTap;
  double? borderRadius;

  String? startIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 19.w(context)),
        width: width ?? 250.w(context),
        height: height ?? 50.h(context),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? AppColors.primaryColor,
            width: borderWidth ?? 1.w(context),
          ),
          boxShadow: [
            BoxShadow(
              color: boxShadowColor ?? AppColors.blackColor.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: bacColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
        ),
        child: FittedBox(
          child: Row(
            children: [
              startIcon == null
                  ? SizedBox()
                  : Image.asset(
                      width: 24,
                      startIcon!,
                    ),
              Gap(5.w(context)),
              Text(
                text,
                style: style ??
                    getTitleStyle(context,
                        color: textColor ?? AppColors.whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
