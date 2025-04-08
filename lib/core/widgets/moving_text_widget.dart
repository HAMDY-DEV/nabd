import 'package:flutter/material.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/text_style.dart';
import 'package:marquee/marquee.dart';
import 'package:nabd/core/util/responsive_layout.dart';

class MovingTextWidget extends StatelessWidget {
  const MovingTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w(context)),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.secondColor, // لون الخلفية
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withAlpha(80),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ]),
      height: 50.h(context), // ارتفاع الشريط
      child: Marquee(
        text: text,
        style: getBodyStyle(context).copyWith(color: Colors.black),
        scrollAxis: Axis.horizontal, // التمرير أفقيًا
        crossAxisAlignment: CrossAxisAlignment.center,
        blankSpace: 50.0, // المسافة بين التكرارات
        velocity: 50.0, // سرعة الحركة
        pauseAfterRound: Duration(seconds: 1), // توقف بعد كل دورة
        startPadding: 10.0,
        accelerationDuration: Duration(seconds: 1), // تسريع البداية
        accelerationCurve: Curves.easeIn,
        decelerationDuration: Duration(milliseconds: 500), // تباطؤ النهاية
        decelerationCurve: Curves.easeOut,
      ),
    );
  }
}
