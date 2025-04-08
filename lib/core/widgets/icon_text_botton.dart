
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/text_style.dart';

class IconTextBotton extends StatelessWidget {
  const IconTextBotton({
    super.key,
    this.onTap,
    this.iconLeft,
    this.iconRight,
    required this.text,
  });
  final String text;
  final IconData? iconLeft;
  final IconData? iconRight;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          iconLeft == null
              ? Gap(0)
              : Icon(iconLeft, color: AppColors.whiteColor),
          Text(
            text,
            style: getBodyStyle(
              context,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          iconRight == null
              ? Gap(0)
              : Icon(iconRight, color: AppColors.whiteColor),
        ],
      ),
    );
  }
}
