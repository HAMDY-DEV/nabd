import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nabd/core/constants/assets_svg.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/features/home/presentation/view/home_view.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:nabd/core/util/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _tabIndex = 0;

  List<Widget> _buildScreens() {
    return [
      HomeView(),
      Scaffold(
        backgroundColor: AppColors.primaryColor,
        
        body: Container(
          margin: EdgeInsets.only(bottom: 25.h(context)),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.r(context)),
              bottomRight: Radius.circular(40.r(context)),
            ),
          ),
          child: Center(child: Text('chat')),
        ),
      ),
      Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Container(
          margin: EdgeInsets.only(bottom: 25.h(context)),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.r(context)),
              bottomRight: Radius.circular(40.r(context)),
            ),
          ),
          child: Center(child: Text('serch')),
        ),
      ),
      Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Container(
          margin: EdgeInsets.only(bottom: 25.h(context)),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.r(context)),
              bottomRight: Radius.circular(40.r(context)),
            ),
          ),
          child: Center(child: Text('profile')),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildScreens()[_tabIndex],

      bottomNavigationBar: StylishBottomBar(
        backgroundColor: AppColors.primaryColor,
        option: AnimatedBarOptions(
          iconSize: 40.r(context),
          iconStyle: IconStyle.animated, // أيقونات متحركة عند التغيير
        ),
        items: [
          BottomBarItem(
            icon: SvgPicture.asset(
              width: 30.w(context),
              height: 30.h(context),
              fit: BoxFit.fill,
              SvgAssets.svgHome,
            ),
            title: Text('Home', style: TextStyle(color: AppColors.whiteColor)),
          ),
          BottomBarItem(
            icon: SvgPicture.asset(
              width: 30.w(context),
              height: 30.h(context),
              fit: BoxFit.fill,
              SvgAssets.svgChatBubble,
            ),
            title: Text('Chat', style: TextStyle(color: AppColors.whiteColor)),
          ),
          BottomBarItem(
            icon: SvgPicture.asset(
              width: 30.w(context),
              height: 30.h(context),
              fit: BoxFit.fill,
              SvgAssets.svgSearch,
            ),
            title: Text(
              'Search',
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ),
          BottomBarItem(
            icon: SvgPicture.asset(
              width: 30.w(context),
              height: 30.h(context),
              fit: BoxFit.fill,
              SvgAssets.svgPerson,
            ),
            title: Text(
              'Profile',
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ),
        ],
        hasNotch: true,
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
