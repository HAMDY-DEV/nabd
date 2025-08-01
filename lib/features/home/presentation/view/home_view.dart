import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/functions/routing.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';
import 'package:nabd/features/create_post/presentation/manager/create_post_cubit.dart';
import 'package:nabd/features/create_post/presentation/view/create_post.dart';
import 'package:nabd/features/home/presentation/manager/home_cubit.dart';
import 'package:nabd/features/home/presentation/manager/home_state.dart';
import 'package:nabd/features/home/presentation/widgets/header_home.dart';
import 'package:nabd/features/home/presentation/widgets/post_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        forceMaterialTransparency: true,
        title: Text(
          'NABD',
          style: getTitleStyle(context, color: AppColors.primaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigatorTo(
                context,
                BlocProvider(
                  create: (context) => CreatePostCubit(),
                  child: CreatePostView(),
                ),
              );
            },
            icon: Icon(FluentIcons.add_16_filled, size: 35.r(context)),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined, size: 35.r(context)),
          ),
          Gap(20.w(context)),
        ],
      ),
      body: Container(
        color: AppColors.primaryColor,
        child: Container(
          margin: EdgeInsets.only(bottom: 25.h(context)),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.scaffoldColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.r(context)),
              bottomRight: Radius.circular(40.r(context)),
            ),
          ),
          child: Column(
            children: [
              Gap(5.h(context)),
              // header home
              HeaderHome(),
              Gap(10.h(context)),

              // posts
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) {
                    if (current is HomePostLoading ||
                        current is HomePostSuccess ||
                        current is HomePostError) {
                      return true;
                    }
                    return false;
                  },

                  builder: (context, state) {
                    var cubit = HomeCubit.get(context);

                    if (state is HomePostLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is HomePostSuccess) {
                      final posts = cubit.posts;

                      if (posts.isEmpty) {
                        return Center(child: Text('No posts yet'));
                      }

                      return ListView.separated(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w(context),
                        ),
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return PostCard(postModel: posts[index]);
                        },
                        separatorBuilder:
                            (context, index) => Gap(20.h(context)),
                      );
                    } else {
                      return Center(child: Text('Something went wrong'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
