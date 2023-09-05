import 'package:flutter/material.dart';

import '../helpers/helpers.dart';

Future<void> showLoading(BuildContext context) async {
  final currentContext =
      context; // Store the context here before entering async code

  await showDialog(
    context: currentContext, // Use the stored context
    barrierDismissible: false,
    builder: (BuildContext context) {
      return SimpleDialog(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircularProgressIndicator(),
              const SizedBox(height: 10),
              Text(R.string.wait, textAlign: TextAlign.center),
            ],
          ),
        ],
      );
    },
  );
}

void hideLoading(BuildContext context) {
  if (context.mounted && Navigator.canPop(context)) {
    Navigator.of(context).pop();
  }
}
