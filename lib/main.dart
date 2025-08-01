import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nabd/core/services/my_bloc_observer.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';
import 'package:nabd/features/intro/presentation/view/splash_screen_view.dart';
import 'package:nabd/firebase_options.dart';
import 'package:nabd/generated/l10n.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  runApp(const NabdApp());
}

class NabdApp extends StatelessWidget {
  const NabdApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Rsp.initRsp(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: getBodyStyle(
            context,
            color: AppColors.blackColor.withAlpha(80),
            fontWeight: FontWeight.bold,
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.notColor),
            borderRadius: BorderRadius.circular(15.r(context)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.notColor),
            borderRadius: BorderRadius.circular(15.r(context)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.redColor),
            borderRadius: BorderRadius.circular(15.r(context)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.redColor),
            borderRadius: BorderRadius.circular(15.r(context)),
          ),
        ),
        appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryColor),
      ),
      locale: Locale('en'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: SplashScreenView(),
    );
  }
}
