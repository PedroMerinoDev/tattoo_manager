import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../helpers/helpers.dart';

Future<void> showLoading(BuildContext context) async {
  final currentContext = context;
  SchedulerBinding.instance.addPostFrameCallback(
    (_) {
      showDialog(
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
          });
    },
  );
}

void hideLoading(BuildContext context) {
  final currentContext = context;
  SchedulerBinding.instance.addPostFrameCallback((_) {
    if (currentContext.mounted && Navigator.canPop(currentContext)) {
      Navigator.of(currentContext).pop();
    }
  });
}
