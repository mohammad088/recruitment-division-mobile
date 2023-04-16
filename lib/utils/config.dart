import 'package:flutter/material.dart';

class Config {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;
  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
    _safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
    safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 100;
  }

  static final spaceSmall = SizedBox(
    height: screenHeight! * 0.02,
  );
  static final spaceMeduim = SizedBox(
    height: screenHeight! * 0.06,
  );
  static final spaceBig = SizedBox(
    height: screenHeight! * 0.1,
  );

  static final wspaceSmall = SizedBox(
    width: screenWidth! * 0.02,
  );
  static final wspaceMeduim = SizedBox(
    width: screenWidth! * 0.06,
  );
  static final wspaceBig = SizedBox(
    width: screenWidth! * 0.1,
  );

  static const outlinedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.grey));
  static const focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.greenAccent),
  );
  static const errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.red),
  );
  static const primaryColor = Colors.greenAccent;
}
