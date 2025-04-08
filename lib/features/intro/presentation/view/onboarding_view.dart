import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/constants/assets_images.dart';
import 'package:nabd/core/functions/routing.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';
import 'package:nabd/features/auth/presentation/view/signin_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController controller = PageController(initialPage: 0);
  int page = 0;

  List<String> titles = [
    'Welcome To Nabd', // تصحيح النص
    'Best Social App to Make New Friends',
    'Enjoy Your Life Anytime, Anywhere',
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: Rsp.getScreenHeight() * 0.83,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.r(context)),
                bottomRight: Radius.circular(40.r(context)),
              ),
            ),
            child: Stack(
              children: [
                PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      page = index;
                    });
                  },
                  children: [
                    Image.asset(
                      Assets.onboarding2,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      Assets.onboarding3,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      Assets.onboarding1,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                if (page != 2)
                  Positioned(
                    top: 70.h(context),
                    right: 40.w(context),
                    child: InkWell(
                      onTap: () {
                        controller.jumpToPage(2);
                      },
                      child: Text(
                        'Skip',
                        style: getBodyStyle(
                          context,
                          color: AppColors.whiteColor,
                          fontSize: 15.sp(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  left: 30.w(context),
                  right: 30.w(context),
                  bottom: 50.h(context),
                  child: SizedBox(
                    width: 200.w(context),
                    child: Text(
                      titles[page],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.38,
                        letterSpacing: -0.70,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 40.w(context),
                  bottom: 30.h(context),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: SlideEffect(
                      spacing: 8.0,
                      radius: 10.r(context),
                      dotWidth: 11.w(context),
                      dotHeight: 11.h(context),
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 1.5,
                      dotColor: Color(0xff898A83).withAlpha(200),
                      activeDotColor: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(10.h(context)),
          GestureDetector(
            onTap: () {
              if (page != 2) {
                controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                navigatorToAndRemoveUntil(context, SigninView());
              }
            },
            child: Container(
              width: double.infinity,
              height: Rsp.getScreenHeight() * 0.15 / 2,
              margin: EdgeInsets.all(20.h(context)),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(40.r(context)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(
                    page != 2 ? 'Next' : 'Get Started',
                    style: getBodyStyle(
                      context,
                      color: AppColors.whiteColor,
                      fontSize: 15.sp(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(flex: 2),
                  Icon(
                    Icons.arrow_forward,
                    size: 35.r(context),
                    color: AppColors.whiteColor,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
