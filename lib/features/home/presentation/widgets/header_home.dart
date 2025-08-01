import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/constants/assets_images.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h(context),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 15.w(context)),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                radius: 35.r(context),
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  radius: 33.r(context),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(Assets.onboarding3),
                    radius: 32.r(context),
                  ),
                ),
              ),
    
              Text(
                'Hamdy',
                style: getSmallStyle(
                  context,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => Gap(5.h(context)),
        itemCount: 15,
      ),
    );
  }
}
