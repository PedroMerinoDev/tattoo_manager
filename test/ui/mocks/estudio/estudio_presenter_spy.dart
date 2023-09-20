import 'dart:async';

import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/ui/pages/estudio/estudio_presenter.dart';
import 'package:tattoo_manager/ui/ui.dart';

class EstudioPresenterSpy extends Mock implements EstudioPresenter {
  final StreamController<UIError?> nameErrorController =
      StreamController<UIError?>();
  final StreamController<UIError?> emailErrorController =
      StreamController<UIError?>();
  final StreamController<UIError?> mainErrorController =
      StreamController<UIError?>();
  final StreamController<String?> navigateToController =
      StreamController<String?>();
  final StreamController<bool> isFormValidController = StreamController<bool>();
  final StreamController<bool> isLoadingController = StreamController<bool>();

  EstudioPresenterSpy() {
    when(() => save()).thenAnswer((_) async => _);
    when(() => nomeEstudioErrorStream)
        .thenAnswer((_) => nameErrorController.stream);
    when(() => emailErrorStream).thenAnswer((_) => emailErrorController.stream);
    when(() => mainErrorStream).thenAnswer((_) => mainErrorController.stream);
    when(() => navigateToStream).thenAnswer((_) => navigateToController.stream);
    when(() => isFormValidStream)
        .thenAnswer((_) => isFormValidController.stream);
    when(() => isLoadingStream).thenAnswer((_) => isLoadingController.stream);
  }

  void emitNameError(UIError error) => nameErrorController.add(error);
  void emitNameValid() => nameErrorController.add(null);
  void emitEmailError(UIError error) => emailErrorController.add(error);
  void emitEmailValid() => emailErrorController.add(null);
  void emitFormError() => isFormValidController.add(false);
  void emitFormValid() => isFormValidController.add(true);
  void emitLoading([bool show = true]) => isLoadingController.add(show);
  void emitMainError(UIError error) => mainErrorController.add(error);
  void emitNavigateTo(String route) => navigateToController.add(route);

  void dispose() {
    nameErrorController.close();
    emailErrorController.close();
    mainErrorController.close();
    navigateToController.close();
    isFormValidController.close();
    isLoadingController.close();
  }
}
