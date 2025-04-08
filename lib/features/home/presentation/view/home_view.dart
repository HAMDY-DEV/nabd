import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';
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
            onPressed: () {},
            icon: Icon(Icons.add, size: 35.r(context)),
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
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 15.w(context)),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return PostCard();
                  },
                  separatorBuilder: (context, index) => Gap(20.h(context)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
