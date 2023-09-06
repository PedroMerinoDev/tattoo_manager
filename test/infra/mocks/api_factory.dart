import 'package:faker/faker.dart';

class ApiFactory {
  static Map makeEstudioJson() => {
        'accessToken': faker.guid.guid(),
        'userId01': faker.randomGenerator.integer(9999),
        'tipoPessoa':
            'Pessoa Jurídica', // Ou 'Pessoa Física' dependendo do caso
        'nomeEstudio': faker.company.name(),
        'urlLogo': faker.internet.httpUrl(),
        'razaoSocial': faker.company.name(),
        'cnpj': faker.randomGenerator.integer(999).toString(),
        'cep': faker.address.zipCode(),
        'endereco': faker.address.streetAddress(),
        'bairro': faker.address.streetName(),
        'estado': faker.address.state(),
        'cidade': faker.address.city(),
        'telefone1': faker.phoneNumber.toString(),
        'telefone2': faker.phoneNumber.toString(),
        'socialMidia': faker.internet.httpUrl(),
        'webSite': faker.internet.httpUrl(),
        'email': faker.internet.email(),
        'nota': faker.randomGenerator.decimal(),
        'dataCadastro': faker.date.dateTime().toIso8601String(),
      };

  static Map makeAccountJson() =>
      {'accessToken': faker.guid.guid(), 'name': faker.person.name()};

  static Map makeSurveyResultJson() => {
        'surveyId': faker.guid.guid(),
        'question': faker.randomGenerator.string(50),
        'answers': [
          {
            'image': faker.internet.httpUrl(),
            'answer': faker.randomGenerator.string(20),
            'percent': faker.randomGenerator.integer(100),
            'count': faker.randomGenerator.integer(1000),
            'isCurrentAccountAnswer': faker.randomGenerator.boolean()
          },
          {
            'answer': faker.randomGenerator.string(20),
            'percent': faker.randomGenerator.integer(100),
            'count': faker.randomGenerator.integer(1000),
            'isCurrentAccountAnswer': faker.randomGenerator.boolean()
          }
        ],
        'date': faker.date.dateTime().toIso8601String(),
      };

  static List<Map> makeSurveyList() => [
        {
          'id': faker.guid.guid(),
          'question': faker.randomGenerator.string(50),
          'didAnswer': faker.randomGenerator.boolean(),
          'date': faker.date.dateTime().toIso8601String(),
        },
        {
          'id': faker.guid.guid(),
          'question': faker.randomGenerator.string(50),
          'didAnswer': faker.randomGenerator.boolean(),
          'date': faker.date.dateTime().toIso8601String(),
        }
      ];

  static Map makeInvalidJson() => {'invalid_key': 'invalid_value'};

  static List<Map> makeInvalidList() => [makeInvalidJson(), makeInvalidJson()];
}
