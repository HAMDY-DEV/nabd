import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';
import 'package:nabd/core/widgets/custom_text_form_field.dart';
import 'package:nabd/core/widgets/icon_text_botton.dart';
import 'package:nabd/features/auth/presentation/widget/custom_button_auth.dart';

class RegistrationView extends StatelessWidget {
  RegistrationView({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconTextBotton(
              iconLeft: Icons.arrow_back_ios,
              text: 'Back',
              onTap: () => Navigator.pop(context),
            ),
            Spacer(flex: 2),
            Text(
              'Create Account',
              style: getTitleStyle(context, color: AppColors.whiteColor),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(top: 30.h(context)),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w(context),
            vertical: 20.h(context),
          ),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r(context)),
              topRight: Radius.circular(40.r(context)),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: getTitleStyle(
                    context,
                    fontSize: 18.sp(context),
                    color: AppColors.blackColor,
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.w900,
                    height: 1.38,
                    letterSpacing: -0.25,
                  ),
                ),
                Gap(10.h(context)),
                SizedBox(
                  width: 350.w(context),
                  child: Text(
                    'Create Account to keep exploring amazing destinations around the world!',
                    style: getBodyStyle(
                      context,
                      color: AppColors.blackColor.withAlpha(150),
                      fontSize: 12.sp(context),
                    ),
                  ),
                ),
                Gap(60.h(context)),

                CustomTextFormField(
                  filled: true,
                  fillColor: AppColors.blackColor.withAlpha(15),
                  hintText: 'Enter your Full name',
                  obscureText: false,
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: AppColors.blackColor.withAlpha(80),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }

                    return null;
                  },
                ),
                Gap(20.h(context)),
                CustomTextFormField(
                  filled: true,
                  fillColor: AppColors.blackColor.withAlpha(15),
                  hintText: 'Enter your email address',
                  obscureText: false,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.blackColor.withAlpha(80),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                Gap(20.h(context)),
                CustomTextFormField(
                  filled: true,
                  fillColor: AppColors.blackColor.withAlpha(15),
                  hintText: 'Enter password',
                  obscureText: false,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_off_outlined,
                      color: AppColors.blackColor.withAlpha(80),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: AppColors.blackColor.withAlpha(80),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    final passwordRegex = RegExp(
                      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                    );
                    if (!passwordRegex.hasMatch(value)) {
                      return 'Password must contain upper & lowercase letters, numbers, and special characters';
                    }
                    return null;
                  },
                ),
                Gap(20.h(context)),
                CustomTextFormField(
                  filled: true,
                  fillColor: AppColors.blackColor.withAlpha(15),
                  hintText: 'Enter confirm password',
                  obscureText: false,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_off_outlined,
                      color: AppColors.blackColor.withAlpha(80),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: AppColors.blackColor.withAlpha(80),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    final passwordRegex = RegExp(
                      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                    );
                    if (!passwordRegex.hasMatch(value)) {
                      return 'Password must contain upper & lowercase letters, numbers, and special characters';
                    }
                    return null;
                  },
                ),
                Gap(10.h(context)),

                CustomButtonAuth(
                  text: 'Create Account',
                  icon: Icons.arrow_forward,
                  onTap: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: getBodyStyle(
                            context,
                            fontSize: 12.sp(context),
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w700,
                            height: 1.38,
                            letterSpacing: -0.25,
                          ),
                        ),

                        TextSpan(
                          text: 'Sign in',
                          style: getBodyStyle(
                            context,
                            color: AppColors.primaryColor,
                            fontSize: 12.sp(context),
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w700,
                            height: 1.38,
                            letterSpacing: -0.25,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
