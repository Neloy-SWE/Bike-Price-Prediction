import 'package:bike_price_prediction/components/custom_loader.dart';
import 'package:bike_price_prediction/utilities/app_size.dart';
import 'package:flutter/material.dart';

import '../utilities/app_texts.dart';

class CustomDialogue {
  static loading({required BuildContext context}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (builder) => Dialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignment: Alignment.center,
        child: ListView(
          padding: const EdgeInsets.all(15),
          shrinkWrap: true,
          children: const [
            MyLoader(),
          ],
        ),
      ),
    );
  }

  static done({required BuildContext context, required String price}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (builder) => Dialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignment: Alignment.center,
        child: ListView(
          padding: const EdgeInsets.all(15),
          shrinkWrap: true,
          children: [
            const Icon(
              Icons.verified_outlined,
              size: 100,
              color: Colors.black,
            ),
            AppSize.gapH20,
            Text(
              "Price for the bike is: BDT $price",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            AppSize.gapH20,
            MaterialButton(
              height: 50,
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                AppTexts.done,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static fail({required BuildContext context}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (builder) => Dialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignment: Alignment.center,
        child: ListView(
          padding: const EdgeInsets.all(15),
          shrinkWrap: true,
          children: [
            const Icon(
              Icons.error_outline_outlined,
              size: 100,
              color: Colors.black,
            ),
            AppSize.gapH20,
            Text(
              "Check your internet",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            AppSize.gapH20,
            MaterialButton(
              height: 50,
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                AppTexts.tryAgain,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
