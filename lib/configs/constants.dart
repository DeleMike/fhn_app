import 'package:flutter/material.dart';

/// Defines the app's name
const String kAppName = 'Fhn Shop';

/// Defines app current version
const String kAppVersion = '0.0.1';

/// Theme font
const String kFontFamily = 'Ubuntu';

// Colors
const Color kWhite = Color(0xFFFFFFFF);
const Color kBlack = Color(0xFF000000);
const Color kGrey = Color(0xFFEBEBEB);
const Color kCanvasColor = Color(0xFFE8EAF6);
const Color kLightBlack = Colors.black26;
const Color kDeepGrey = Color(0xFF4A4A4A);
const Color kPrimaryColor = Color(0xFF3F51B5);
const Color kDarkPrimaryColor = Color(0xFF303F9F);
const Color kLightPrimaryColor = Color(0xFFC5CAE9);
const Color kAccentColor = Color(0xFFFF9800);
const Color kPrimaryTextColor = Color(0xFF212121);
const Color kSecondaryTextColor = Color(0xFF757575);
const Color kDividerColor = Color(0xFFBDBDBD);
const Color kRed = Color(0xFF960000);
const Color kGreen = Color(0xFF4A9E24);
const Color kTransparent = Colors.transparent;

// Padding
const double kPaddingS = 10.0;
const double kPaddingM = 20.0;

// Border Radius
const double kSmallRadius = 12.0;

const double kCardElevation = 5.0;
const double kButtonRadius = 10.0;
const double kDialogRadius = 20.0;

/// Get screen height
double kScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/// Get screen width
double kScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Get screen orientation
Orientation kGetOrientation(BuildContext context) {
  return MediaQuery.of(context).orientation;
}

/// Assets images
class AssetsImages {
  static const String product1 = 'assets/images/product-1.png';
  static const String product2 = 'assets/images/product-2.png';
  static const String product3 = 'assets/images/product-3.png';
  static const String product4 = 'assets/images/product-4.png';
  static const String product5 = 'assets/images/product-5.png';
  static const String product6 = 'assets/images/product-6.png';
  static const String product7 = 'assets/images/product-7.png';
  static const String product8 = 'assets/images/product-8.png';
  static const String product9 = 'assets/images/product-9.png';
  static const String product10 = 'assets/images/product-10.png';
  static const String product11 = 'assets/images/product-11.png';
  static const String product12 = 'assets/images/product-12.png';
  static const String product13 = 'assets/images/product-13.png';
  static const String product14 = 'assets/images/product-14.png';
  static const String product15 = 'assets/images/product-15.png';
  static const String product16 = 'assets/images/product-16.png';
}
