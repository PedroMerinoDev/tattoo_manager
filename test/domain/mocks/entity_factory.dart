import 'package:faker/faker.dart';
import 'package:tattoo_manager/domain/domain.dart';

class EntityFactory {
  static EstudioEntity08 makeEstudio() => EstudioEntity08(
        userId01: faker.randomGenerator.integer(9999),
        tipoPessoa: faker.randomGenerator.boolean()
            ? 'Pessoa Jurídica'
            : 'Pessoa Física',
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
        dataCadastro: DateTime.utc(3569, 1, 18, 3, 59, 31, 712570),
      );

  static AccountEntity makeAccount() => AccountEntity(token: faker.guid.guid());

  static SurveyResultEntity makeSurveyResult() => SurveyResultEntity(
        surveyId: faker.guid.guid(),
        question: faker.lorem.sentence(),
        answers: [
          SurveyAnswerEntity(
            image: faker.internet.httpUrl(),
            answer: faker.lorem.sentence(),
            isCurrentAnswer: true,
            percent: 40,
          ),
          SurveyAnswerEntity(
            answer: faker.lorem.sentence(),
            isCurrentAnswer: false,
            percent: 60,
          )
        ],
      );

  static List<SurveyEntity> makeSurveyList() => [
        SurveyEntity(
          id: faker.guid.guid(),
          question: faker.randomGenerator.string(10),
          dateTime: DateTime.utc(2020, 2, 2),
          didAnswer: true,
        ),
        SurveyEntity(
          id: faker.guid.guid(),
          question: faker.randomGenerator.string(10),
          dateTime: DateTime.utc(2018, 12, 20),
          didAnswer: false,
        )
      ];
}
