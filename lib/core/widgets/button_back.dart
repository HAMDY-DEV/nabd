import 'package:flutter/material.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';


class ButtonBack extends StatelessWidget {
 const ButtonBack(
      {super.key, this.appPadding, this.height, this.width, this.iconSize});

  final double? appPadding;
  final double? height;
  final double? width;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(appPadding ?? 16.w(context)),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          width: width ?? 50.w(context),
          height: height ?? 50.h(context),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(100.r(context)),
          ),
          child: Center(
              child: Icon(
            Icons.arrow_back,
            size: iconSize ?? 28.sp(context),
          )),
        ),
      ),
    );
  }
}
