import 'package:faker/faker.dart';
import 'package:tattoo_manager/domain/domain.dart';
import 'package:tattoo_manager/domain/usecases/estudio/estudio.dart';

class ParamsFactory {
  static AddAccountParams makeAddAccount() => AddAccountParams(
        name: faker.person.name(),
        email: faker.internet.email(),
        password: faker.internet.password(),
        passwordConfirmation: faker.internet.password(),
      );

  static AuthenticationParams makeAuthentication() => AuthenticationParams(
        email: faker.internet.email(),
        secret: faker.internet.password(),
      );

  static AddEstudio08Params makeAddEstudio() => AddEstudio08Params(
        userId01: faker.randomGenerator.integer(9999),
        tipoPessoa: 'Pessoa Jurídica', // Ou 'Pessoa Física' dependendo do caso
        nomeEstudio: faker.company.name(),
        urlLogo: faker.internet.httpUrl(),
        razaoSocial: faker.company.name(),
        cnpj: faker.randomGenerator.integer(999).toString(),
        cep: faker.address.zipCode(),
        endereco: faker.address.streetAddress(),
        bairro: faker.address.streetName(),
        estado: faker.address.state(),
        cidade: faker.address.city(),
        telefone1: faker.phoneNumber.toString(),
        telefone2: faker.phoneNumber.toString(),
        socialMidia: faker.internet.httpUrl(),
        webSite: faker.internet.httpUrl(),
        email: faker.internet.email(),
        nota: faker.randomGenerator.decimal(),
        dataCadastro: faker.date.dateTime(),
      );
}
