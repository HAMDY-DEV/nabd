import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nabd/core/constants/assets_images.dart';

import 'package:nabd/core/functions/routing.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';
import 'package:nabd/features/intro/presentation/view/onboarding_view.dart';
import 'package:nabd/generated/l10n.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  SplashScreenViewState createState() => SplashScreenViewState();
}

class SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      navigatorToAndRemoveUntil(context, const OnboardingView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primaryColor,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(Assets.backgroundSplash),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 250.h(context),
              left: 50.w(context),
              right: 50.w(context),
              bottom: 250.h(context),
              child: SvgPicture.asset(
                fit: BoxFit.cover,
                Assets.nabdLogo,
                width: 300.w(context),
                height: 300.h(context),
              ),
            ),
            Positioned(
              left: 50.w(context),
              right: 50.w(context),
              bottom: 40.h(context),
              child: Text(
                S.of(context).nameApp,
                textAlign: TextAlign.center,
                style: getBodyStyle(
                  context,
                  fontSize: 15.sp(context),
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
