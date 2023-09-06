import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/domain/usecases/estudio/estudio.dart';
import 'package:test/test.dart';

class RemoteAddEstudio08 {
  late final HttpClient httpClient;
  late final String url;

  RemoteAddEstudio08({required this.httpClient, required this.url});

  Future<void> save(AddEstudioParams params) async {
    final body = {
      'userId01': params.userId01,
      'tipoPessoa': params.tipoPessoa,
      'nomeEstudio': params.nomeEstudio,
      'urlLogo': params.urlLogo,
      'razaoSocial': params.razaoSocial,
      'cnpj': params.cnpj,
      'cep': params.cep,
      'endereco': params.endereco,
      'bairro': params.bairro,
      'estado': params.estado,
      'cidade': params.cidade,
      'telefone1': params.telefone1,
      'telefone2': params.telefone2,
      'socialMidia': params.socialMidia,
      'webSite': params.webSite,
      'email': params.email,
      'nota': params.nota,
      'dataCadastro': params.dataCadastro.toIso8601String(),
    };

    await httpClient.request(url: url, method: 'post', body: body);
  }
}

abstract class HttpClient {
  Future<void> request({required String url, required String method, Map body});
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  late HttpClientSpy httpClient;
  late String url;
  late RemoteAddEstudio08 sut;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAddEstudio08(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values', () async {
    final params = AddEstudioParams(
      userId01: faker.randomGenerator.integer(9999),
      tipoPessoa: 'Pessoa Jurídica',
      nomeEstudio: faker.company.name(),
      urlLogo: faker.internet.httpUrl(),
      razaoSocial: faker.company.name(),
      cnpj: faker.randomGenerator.integer(9999).toString(),
      cep: faker.address.zipCode(),
      endereco: faker.address.streetAddress(),
      bairro: faker.address.streetName(),
      estado: faker.address.toString(),
      cidade: faker.address.city(),
      telefone1: faker.phoneNumber.toString(),
      telefone2: faker.phoneNumber.toString(),
      socialMidia: faker.internet.httpUrl(),
      webSite: faker.internet.httpUrl(),
      email: faker.internet.email(),
      nota: faker.randomGenerator.decimal(),
      dataCadastro: faker.date.dateTime(),
    );

    // Configurando o comportamento esperado do HttpClientSpy
    when(() => httpClient.request(
        url: any(named: 'url'),
        method: 'post',
        body: any(named: 'body'))).thenAnswer((_) async {});

    await sut.save(params);

    // Capture o argumento passado para httpClient.request
    final capturedArguments = verify(() => httpClient.request(
          url: url,
          method: 'post',
          body: captureAny(named: 'body'),
        )).captured;

    // Verifique o corpo (body) da solicitação HTTP
    final body = capturedArguments[0] as Map<String, dynamic>;
    expect(body['userId01'], params.userId01);
    expect(body['tipoPessoa'], params.tipoPessoa);
    expect(body['nomeEstudio'], params.nomeEstudio);
    // Verifique os outros campos conforme necessário
  });
}
