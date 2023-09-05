import 'package:flutter/material.dart';

import '../components/components.dart';

mixin LoadingManager {
  void handleLoading(BuildContext context, Stream<bool> stream) {
    stream.listen((bool isLoading) async {
      if (isLoading == true && context.mounted) {
        showLoading(context);
      } else {
        hideLoading(context);
      }
    });
  }
}
