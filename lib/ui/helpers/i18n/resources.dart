import 'package:flutter/widgets.dart';
import 'package:tattoo_manager/ui/helpers/i18n/assets/images.dart';

import './strings/strings.dart';
import 'assets/assets.dart';

class R {
  static Translation string = PtBr();

  static void load(Locale locale) {
    switch (locale.toString()) {
      default:
        string = PtBr();
        break;
    }
  }

  static Assets assets = Images();
}
