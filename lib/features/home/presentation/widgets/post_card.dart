import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/constants/assets_images.dart';
import 'package:nabd/core/functions/show_snack_and_lottie.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';
import 'package:nabd/features/home/models/post_model.dart';
import 'package:nabd/features/home/presentation/manager/home_cubit.dart';
import 'package:nabd/features/home/presentation/manager/home_state.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.postModel});

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    cubit.getCreatorData(postModel.creatorId);
    return Card(
      color: AppColors.whiteColor,
      elevation: 0.3,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w(context),
          vertical: 20.h(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header post
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) {
                if (current is CreatorPostSuccess ||
                    current is CreatorPostError ||
                    current is CreatorPostLoading) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                if (state is CreatorPostSuccess) {
                  return Row(
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
                            backgroundImage: NetworkImage(
                              state.userData['photo'] ?? '',
                            ),
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
                              state.userData['name'] ?? '',
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
                              state.userData['uid'] ?? '',
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
                  );
                } else if (state is CreatorPostError) {
                  return Center(child: Text('error'));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            Gap(10.h(context)),
            //image post
            Container(
              height: 350.h(context),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r(context)),
                image: DecorationImage(
                  image: NetworkImage(postModel.photo),
                  fit: BoxFit.fill,
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
                    if (postModel.likes.contains(cubit.userId)) {
                      cubit.unlikePost(postModel.keyPost);
                    } else {
                      cubit.likePost(postModel.keyPost);
                    }
                  },

                  child: Image.asset(
                    height: 24.h(context),
                    width: 24.w(context),
                    postModel.likes.contains(cubit.userId)
                        ? Assets.heart
                        : Assets.heartBorder,
                  ),
                ),
                Text(
                  postModel.likes.length.toString(),
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
                    FluentIcons.comment_16_regular,
                    size: 30.r(context),
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  postModel.comments.length.toString(),
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
                    FluentIcons.share_16_regular,
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
              textAlign: TextAlign.start,
              postModel.description,
              maxLines: 5,
              style: getBodyStyle(context, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
