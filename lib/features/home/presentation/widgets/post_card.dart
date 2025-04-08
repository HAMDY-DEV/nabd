import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/constants/assets_images.dart';
import 'package:nabd/core/functions/show_snack_and_lottie.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      elevation: 0.3,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w(context),
          vertical: 20.h(context),
        ),
        child: Column(
          children: [
            //header post
            Row(
              children: [
                Gap(10.w(context)),
                //image profile
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 25.r(context),
                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    radius: 23.r(context),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(Assets.onboarding3),
                      radius: 22.r(context),
                    ),
                  ),
                ),
                Gap(10.w(context)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    //name
                    SizedBox(
                      width: 200.w(context),
                      child: Text(
                        'Hamdy Fathy',
                        overflow: TextOverflow.ellipsis,
                        style: getBodyStyle(
                          context,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    //username
                    SizedBox(
                      width: 200.w(context),
                      child: Text(
                        'hamdy_fathy',
                        overflow: TextOverflow.ellipsis,
                        style: getSmallStyle(context),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                //more
                Icon(Icons.more_horiz, size: 30.r(context)),
                Gap(10.w(context)),
              ],
            ),
            Gap(10.h(context)),
            //image post
            Container(
              height: 350.h(context),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r(context)),
                image: DecorationImage(
                  image: AssetImage(Assets.onboarding1),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  //location
                  Positioned(
                    top: 15.h(context),
                    right: 15.w(context),
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.copy),
                    ),
                  ),
                ],
              ),
            ),
            Gap(10.h(context)),
            //actions
            Row(
              spacing: 3.w(context),
              children: [
                //like
                GestureDetector(
                  onTap: () {
                    showsSnackBar(
                      context: context,
                      text: 'Liked successfully',
                      color: AppColors.primaryColor,
                    );
                  },
                  child: Icon(
                    Icons.favorite_border,
                    size: 30.r(context),
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  '1.2k',
                  style: getBodyStyle(
                    context,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(10.w(context)),
                //comment
                GestureDetector(
                  onTap: () {
                    showsSnackBar(
                      context: context,
                      text: 'Comment successfully',
                      color: AppColors.primaryColor,
                    );
                  },
                  child: Icon(
                    Icons.comment,
                    size: 30.r(context),
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  '2k',
                  style: getBodyStyle(
                    context,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(10.w(context)),
                //share
                GestureDetector(
                  onTap: () {
                    showsSnackBar(
                      context: context,
                      text: 'Shared successfully',
                      color: AppColors.primaryColor,
                    );
                  },
                  child: Icon(
                    Icons.share,
                    size: 30.r(context),
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  'Share',
                  style: getBodyStyle(
                    context,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            //caption
            Gap(10.h(context)),
            Text(
              overflow: TextOverflow.ellipsis,
              'This is a caption for a post. You can add more details here if needed.',
              maxLines: 5,
              style: getBodyStyle(context, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
