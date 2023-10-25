import 'package:bike_price_prediction/utilities/app_texts.dart';
import 'package:flutter/material.dart';

import '../components/custom_loader.dart';
import '../utilities/app_size.dart';
import '../utilities/image_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTexts.welcome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                ImagePath.bike,
                height: 200,
              ),
              Column(
                children: [
                  Text(
                    AppTexts.bikePricePredictionApp,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  AppSize.gapH40,
                  const MyLoader(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
