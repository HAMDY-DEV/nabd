import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/functions/show_snack_and_lottie.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';
import 'package:nabd/core/widgets/custom_text_form_field.dart';
import 'package:nabd/core/widgets/icon_text_botton.dart';
import 'package:nabd/features/auth/presentation/manager/registration_cubit/registration_cubit.dart';
import 'package:nabd/features/auth/presentation/manager/registration_cubit/registration_state.dart';
import 'package:nabd/features/auth/presentation/widget/custom_button_auth.dart';

// ignore: must_be_immutable
class RegistrationView extends StatelessWidget {
  RegistrationView({super.key});

  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationSuccess) {
          showsSnackBar(context: context, text: 'Registration Success');
          Navigator.pop(context);
        } else if (state is RegistrationError) {
          showsSnackBar(
            context: context,
            text: state.message,
            color: AppColors.redColor,
          );
        }
      },
      child: Scaffold(
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
                    controller: nameController,
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
                    controller: emailController,
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
                    controller: passwordController,
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

                  Gap(10.h(context)),

                  BlocBuilder<RegistrationCubit, RegistrationState>(
                    builder: (context, state) {
                      if (state is RegistrationLoading) {
                        return Container(
                          width: double.infinity,
                          height: Rsp.getScreenHeight() * 0.15 / 2,
                          margin: EdgeInsets.all(20.h(context)),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(40.r(context)),
                          ),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        );
                      } else {
                        return CustomButtonAuth(
                          text: 'Create Account',
                          icon: Icons.arrow_forward,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              final cubit = RegistrationCubit.get(context);
                              cubit.register(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                              );
                            }
                          },
                        );
                      }
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
      ),
    );
  }
}
