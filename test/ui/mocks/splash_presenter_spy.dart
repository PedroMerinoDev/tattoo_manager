import 'dart:async';

import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/ui/ui.dart';

class SplashPresenterSpy extends Mock implements SplashPresenter {
  final StreamController<String?> navigateToController =
      StreamController<String?>();

  SplashPresenterSpy() {
    when(() => checkAccount(durationInSeconds: any(named: 'durationInSeconds')))
        .thenAnswer((_) async => _);
    when(() => navigateToStream).thenAnswer((_) => navigateToController.stream);
  }
  void emitNavigateTo(String route) => navigateToController.add(route);

  void dispose() {
    navigateToController.close();
  }
}
