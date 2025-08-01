import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/functions/routing.dart';
import 'package:nabd/core/functions/show_snack_and_lottie.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';
import 'package:nabd/core/widgets/bottom_nav_bar.dart';
import 'package:nabd/core/widgets/custom_text_form_field.dart';
import 'package:nabd/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:nabd/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:nabd/features/auth/presentation/manager/login_cubit/login_state.dart';
import 'package:nabd/features/auth/presentation/manager/registration_cubit/registration_cubit.dart';
import 'package:nabd/features/auth/presentation/view/forgot_password_view.dart';
import 'package:nabd/features/auth/presentation/view/registration_view.dart';
import 'package:nabd/features/auth/presentation/widget/custom_button_auth.dart';
import 'package:nabd/features/home/presentation/manager/home_cubit.dart';

// ignore: must_be_immutable
class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        if (mounted) {
          navigatorToAndRemoveUntil(
            context,
            BlocProvider(
              create: (context) => HomeCubit()..listenToPosts(),
              child: BottomNavBar(),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showsSnackBar(context: context, text: 'Login Success');
          navigatorToAndRemoveUntil(
            context,
            BlocProvider(
              create: (context) => HomeCubit()..listenToPosts(),
              child: BottomNavBar(),
            ),
          );
        } else if (state is LoginError) {
          showsSnackBar(context: context, text: state.message);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          title: Text(
            'Login Account',
            style: getTitleStyle(context, color: AppColors.whiteColor),
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
                    'Welcome To NABD',
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
                      'Log in to continue exploring amazing destinations around the world!',
                      style: getBodyStyle(
                        context,
                        fontFamily: 'Source Sans Pro',

                        color: AppColors.blackColor.withAlpha(150),
                        fontSize: 12.sp(context),
                      ),
                    ),
                  ),
                  Gap(60.h(context)),

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
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(
                        isObscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
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

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        navigatorTo(
                          context,
                          BlocProvider(
                            create: (context) => ForgotPasswordCubit(),
                            child: ForgotPasswordView(),
                          ),
                        );
                      },
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

                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
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
                          text: 'Log in',
                          icon: Icons.arrow_forward,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              final cubit = LoginCubit.get(context);
                              cubit.login(
                                email: emailController.text,
                                password: passwordController.text,
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
                                    navigatorTo(
                                      context,
                                      BlocProvider(
                                        create:
                                            (context) => RegistrationCubit(),
                                        child: RegistrationView(),
                                      ),
                                    );
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
