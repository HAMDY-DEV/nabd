import 'package:flutter/material.dart';
import 'package:nabd/core/constants/assets_images.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';

class MessagesCard extends StatelessWidget {
  const MessagesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h(context)),
      child: Row(
        children: [
          Container(
            height: 50.h(context),
            width: 50.h(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blackColor,
              image: DecorationImage(
                image: AssetImage(Assets.onboarding3),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 14.h(context),
                width: 14.h(context),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.greenColor,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w(context)),
          Container(
            alignment: Alignment.centerLeft,
            width: 200.w(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hamdy Fathy',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getBodyStyle(
                    context,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp(context),
                  ),
                ),
                Text(
                  'Hello, How are you? hbfhjsfjhsdvfghjhhg',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getBodyStyle(
                    context,
                    color: AppColors.blackColor.withAlpha(
                      150,
                    ),
                    fontSize: 10.sp(context),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            '10:00 AM',
            style: getBodyStyle(
              context,
              color: AppColors.blackColor.withAlpha(150),
              fontSize: 10.sp(context),
            ),
          ),
        ],
      ),
    );
  }
}
