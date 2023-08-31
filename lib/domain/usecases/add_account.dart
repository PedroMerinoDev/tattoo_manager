import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class AddAccount {
  Future<AccountEntity> add(AddAccountParams params);
}

class AddAccountParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String role07Id;

  List get props => [name, email, password, passwordConfirmation, role07Id];

  AddAccountParams(
      {required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirmation,
      required this.role07Id});
}
