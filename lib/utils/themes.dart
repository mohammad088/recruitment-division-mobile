import 'package:flutter/material.dart';

class Themes {
  static ThemeData themeData = ThemeData(
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Colors.white,
          elevation: 3),
      scaffoldBackgroundColor: const Color.fromRGBO(234, 233, 233, 0.8),
      drawerTheme: const DrawerThemeData(),
      inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Colors.red,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.grey))));
}
