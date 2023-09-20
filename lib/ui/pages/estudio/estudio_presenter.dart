import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';

abstract class EstudioPresenter implements Listenable {
  Stream<UIError?> get nomeEstudioErrorStream;
  Stream<UIError?> get emailErrorStream;
  Stream<UIError?> get mainErrorStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<String?> get navigateToStream;

  void validateNomeEstudio(String name);
  void validateEmail(String email);

  Future<void> save();
}
