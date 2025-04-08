import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color(0xFF3B9678);
  static Color secondColor = const Color(0xFFFFD233);
  static Color greyColor = const Color(0xffB8B8B8);
  static Color whiteColor = Colors.white;
  static Color notColor = const Color(0x00000000);
  static Color blackColor = Colors.black;
  static Color redColor = Colors.red;
  

  static Gradient gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.repeated,
    colors: [
      Color(0xFF96BBFE),
      Color(0xFF96BBFE),
      Color(0xFFCCFDD9),
    ],
  );

  static Gradient gradient2 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.repeated,
    colors: [
      Color(0xFFCCFDD9),
      Color(0xFF96BBFE),
    ],
  );
  static Gradient gradient3 = LinearGradient(
    begin: Alignment(-0.01, -1.00),
    end: Alignment(0.01, 1),
    colors: [Color(0xFF97BCFF), Color(0xFFC4F3E0)],
  );
}
