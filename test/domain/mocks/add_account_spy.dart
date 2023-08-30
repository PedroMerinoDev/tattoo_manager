import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/domain/domain.dart';

class AddAccountSpy extends Mock implements AddAccount {
  When mockAddAccountCall() => when(() => add(any()));
  void mockAddAccount(AccountEntity data) =>
      mockAddAccountCall().thenAnswer((_) async => data);
  void mockAddAccountError(DomainError error) =>
      mockAddAccountCall().thenThrow(error);
}
