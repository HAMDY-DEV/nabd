import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
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
        margin: EdgeInsets.only(bottom: 25.h(context)),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.r(context)),
            bottomRight: Radius.circular(40.r(context)),
          ),
        ),
        child: Center(child: Text('Home')),
      ),
    );
  }
}
