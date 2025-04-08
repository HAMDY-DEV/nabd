import 'dart:io';

import 'package:flutter/material.dart';

class Rsp {
  static double? _baseWidth;
  static double? _baseHeight;

  static void initRsp(context) {
    _baseHeight = MediaQuery.sizeOf(context).height;
    _baseWidth = MediaQuery.sizeOf(context).width;
  }
   static bool isIOS() {
    return Platform.isIOS ? true : false;
  }

  static double getScreenWidth() {
    return _baseWidth!;
  }

  static double getScreenHeight() {
    return _baseHeight!;
  }

  static double getWidth(double width, BuildContext context) {
    final double screenWidth = context.screenWidth();
    return width / _baseWidth! * screenWidth;
  }

  static double getHeight(double height, BuildContext context) {
    final double screenHeight = context.screenHeight();
    return height / _baseHeight! * screenHeight;
  }

  static double getFontSize(double fontSize, BuildContext context) {
    final double screenWidth = context.screenWidth();
    if (context.isiPad()) {
      double scaleFactor = screenWidth / _baseWidth!;
      return fontSize * scaleFactor;
    }
    return screenWidth / 100 * (fontSize / 3);
  }

  /// 🔵 دالة لحساب الـ Radius بطريقة متجاوبة
  static double getRadius(double radius, BuildContext context) {
    final double screenWidth = context.screenWidth();
    return radius / _baseWidth! * screenWidth;
  }
}

extension ResponsiveNum on num {
  double w(BuildContext context) {
    return Rsp.getWidth(toDouble(), context);
  }

  double h(BuildContext context) {
    return Rsp.getHeight(toDouble(), context);
  }

  double sp(BuildContext context) {
    return Rsp.getFontSize(toDouble(), context);
  }

  /// 🟢 تحويل أي رقم إلى Radius متجاوب
  double r(BuildContext context) {
    return Rsp.getRadius(toDouble(), context);
  }
}

extension ResponsiveContext on BuildContext {
  double screenHeight() {
    final mediaQuery = MediaQuery.of(this);
    return mediaQuery.orientation == Orientation.portrait
        ? mediaQuery.size.height
        : mediaQuery.size.width;
  }

  double screenWidth() {
    final mediaQuery = MediaQuery.of(this);
    return mediaQuery.orientation == Orientation.portrait
        ? mediaQuery.size.width
        : mediaQuery.size.height;
  }

  int getGridCrossAxisCount() {
    return isiPad() ? 3 : 2;
  }

  bool isiPad() {
    return screenWidth() > 600;
  }



  double calculateChildAspectRatio() {
    double referenceAspectRatio = 430 / 932;
    double currentAspectRatio = screenWidth() / screenHeight();
    double ratioDifference = currentAspectRatio / referenceAspectRatio;
    double childAspectRatio = (2 / 2.68) * ratioDifference;
    return isiPad() ? childAspectRatio / 2.3 : childAspectRatio;
  }
}
