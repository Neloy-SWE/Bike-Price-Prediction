import 'package:bike_price_prediction/utilities/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTheme {
  static final get = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      color: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        fontFamily: AppTexts.fontBold,
        color: Colors.black,
        fontSize: 20,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: AppTexts.fontRegular,
        color: Colors.black,
        fontSize: 25,
      ),

      titleMedium: TextStyle(
        fontFamily: AppTexts.fontBold,
        color: Colors.black,
        fontSize: 15,
      ),
      bodyMedium: TextStyle(
        fontFamily: AppTexts.fontRegular,
        color: Colors.black,
        fontSize: 13,
      ),
      bodySmall: TextStyle(
        fontFamily: AppTexts.fontRegular,
        color: Colors.black26,
        fontSize: 13,
      ),
      titleSmall: TextStyle(
        fontFamily: AppTexts.fontBold,
        color: Colors.red,
        fontSize: 11,
      ),
      titleLarge: TextStyle(
        fontFamily: AppTexts.fontBold,
        color: Colors.white,
        fontSize: 13,
      ),
      displayLarge: TextStyle(
        fontFamily: AppTexts.fontBold,
        color: Colors.black,
        fontSize: 20,
      ),
    ),
  );
}
