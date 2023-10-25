import 'package:flutter/material.dart';

class CustomFieldHeader {
  static get({
    required BuildContext context,
    required String title,
    required bool isRequired,
  }) {
    return RichText(
        text: TextSpan(children: [
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextSpan(
            text: isRequired ? " *" : "",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.red),
          ),
        ]));
  }
}