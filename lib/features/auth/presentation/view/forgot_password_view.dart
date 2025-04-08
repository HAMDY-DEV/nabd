import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/functions/routing.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';
import 'package:nabd/core/widgets/custom_text_form_field.dart';
import 'package:nabd/core/widgets/icon_text_botton.dart';
import 'package:nabd/features/auth/presentation/view/registration_view.dart';
import 'package:nabd/features/auth/presentation/widget/custom_button_auth.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

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
              'Forgot Password',
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
                  'Don’t worry, I’ll help you',
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
                    'Enter the email address associated with your account, and we’ll send you a link to reset your password.',
                    style: getBodyStyle(
                      context,
                      color: AppColors.blackColor.withAlpha(150),
                      fontSize: 12.sp(context),
                    ),
                  ),
                ),
                Gap(60.h(context)),

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

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: getBodyStyle(
                        context,
                        color: AppColors.primaryColor,
                        fontSize: 12.sp(context),
                      ),
                    ),
                  ),
                ),
                Gap(10.h(context)),

                CustomButtonAuth(
                  text: 'send link',
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
                          text: "Don't have an account? ",
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
                          text: 'Create one',
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
                                  navigatorTo(context, RegistrationView());
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
