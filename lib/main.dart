import 'package:bike_price_prediction/screens/screen_splash.dart';
import 'package:bike_price_prediction/utilities/app_texts.dart';
import 'package:flutter/material.dart';

import 'components/theme/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.get,
        title: AppTexts.appTitle,
        home: const SplashScreen(),
      ),
    );
  }
}
