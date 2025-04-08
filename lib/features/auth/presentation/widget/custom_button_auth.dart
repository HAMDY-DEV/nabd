
import 'package:flutter/material.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({super.key, required this.text, this.icon, this.onTap});

  final String text;
  final IconData? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: Rsp.getScreenHeight() * 0.15 / 2,
        margin: EdgeInsets.all(20.h(context)),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(40.r(context)),
        ),
        child: Row(
          children: [
            Spacer(),

            Text(
              text,
              style: getBodyStyle(
                context,
                color: AppColors.whiteColor,
                fontSize: 15.sp(context),
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 5),
            Icon(icon, size: 35.r(context), color: AppColors.whiteColor),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
