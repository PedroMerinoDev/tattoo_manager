import 'package:faker/faker.dart';
import 'package:tattoo_manager/domain/domain.dart';

class ParamsFactory {
  static AddAccountParams makeAddAccount() => AddAccountParams(
        name: faker.person.name(),
        email: faker.internet.email(),
        password: faker.internet.password(),
        passwordConfirmation: faker.internet.password(),
        role07Id: faker.randomGenerator.string(900),
      );

  static AuthenticationParams makeAuthentication() => AuthenticationParams(
        email: faker.internet.email(),
        secret: faker.internet.password(),
      );
}
