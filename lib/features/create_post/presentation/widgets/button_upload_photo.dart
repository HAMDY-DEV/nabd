import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';

class ButtonUploadPhoto extends StatelessWidget {
  const ButtonUploadPhoto({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.w(context)),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20.r(context)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Upload photos',
              style: getBodyStyle(
                context,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gap(5.w(context)),
            Icon(Icons.photo, color: AppColors.whiteColor),
          ],
        ),
      ),
    );
  }
}
