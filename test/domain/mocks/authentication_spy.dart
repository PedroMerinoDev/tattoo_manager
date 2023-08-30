import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/domain/domain.dart';

class AuthenticationSpy extends Mock implements Authentication {
  When mockAuthenticationCall() => when(() => auth(any()));
  void mockAuthentication(AccountEntity data) =>
      mockAuthenticationCall().thenAnswer((_) async => data);
  void mockAuthenticationError(DomainError error) =>
      mockAuthenticationCall().thenThrow(error);
}
