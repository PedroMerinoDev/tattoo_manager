import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';

abstract class EstudioPresenter implements Listenable {
  Stream<UIError?> get nameErrorStream;
  Stream<UIError?> get emailErrorStream;
  Stream<UIError?> get mainErrorStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<String?> get navigateToStream;

  void validateName(String name);
  void validateEmail(String email);

  Future<void> save();
}
