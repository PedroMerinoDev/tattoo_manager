import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/data/http/http.dart';
import 'package:tattoo_manager/data/usecases/estudio/estudio.dart';
import 'package:tattoo_manager/domain/domain.dart';
import 'package:tattoo_manager/domain/usecases/estudio/add_estudio_08.dart';
import 'package:test/test.dart';

import '../../../domain/mocks/mocks.dart';
import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

void main() {
  late RemoteAddEstudio08 sut;
  late HttpClientSpy httpClient;
  late String url;
  late AddEstudio08Params params;
  late Map apiResult;

  setUp(() {
    url = faker.internet.httpUrl();
    params = ParamsFactory.makeAddEstudio();
    apiResult = ApiFactory.makeEstudioJson();
    httpClient = HttpClientSpy();
    httpClient.mockRequest(apiResult);
    sut = RemoteAddEstudio08(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values', () async {
    await sut.add(params);

    verify(
      () => httpClient.request(
        url: url,
        method: 'post',
        body: {
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
          'dataCadastro': params.dataCadastro,
        },
      ),
    );
  });

  test('Should throw UnexpectedError if HttpClient returns 400', () async {
    httpClient.mockRequestError(HttpError.badRequest);

    final Future<EstudioEntity08> future = sut.add(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    httpClient.mockRequestError(HttpError.notFound);

    final Future<EstudioEntity08> future = sut.add(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    httpClient.mockRequestError(HttpError.serverError);

    final Future<EstudioEntity08> future = sut.add(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw InvalidCredentialsError if HttpClient returns 403',
      () async {
    httpClient.mockRequestError(HttpError.forbidden);

    final Future<EstudioEntity08> future = sut.add(params);

    expect(future, throwsA(DomainError.emailInUse));
  });

  test('Should return an Estudio if HttpClient returns 200', () async {
    final EstudioEntity08 estudio = await sut.add(params);
    expect(estudio.nomeEstudio, apiResult['nomeEstudio']);
    expect(estudio.userId01, apiResult['userId01']);
    expect(estudio.tipoPessoa, apiResult['tipoPessoa']);
    expect(estudio.urlLogo, apiResult['urlLogo']);
    expect(estudio.razaoSocial, apiResult['razaoSocial']);
    expect(estudio.cnpj, apiResult['cnpj']);
    expect(estudio.cep, apiResult['cep']);
    expect(estudio.endereco, apiResult['endereco']);
    expect(estudio.bairro, apiResult['bairro']);
    expect(estudio.estado, apiResult['estado']);
    expect(estudio.cidade, apiResult['cidade']);
    expect(estudio.telefone1, apiResult['telefone1']);
    expect(estudio.telefone2, apiResult['telefone2']);
    expect(estudio.socialMidia, apiResult['socialMidia']);
    expect(estudio.webSite, apiResult['webSite']);
    expect(estudio.email, apiResult['email']);
    expect(estudio.nota, apiResult['nota']);
    expect(estudio.dataCadastro, DateTime.parse(apiResult['dataCadastro']));
  });

  test(
      'Should throw UnexpectedError if HttpClient returns 200 with invalid data',
      () async {
    httpClient.mockRequest({'invalid_key': 'invalid_value'});

    final Future<EstudioEntity08> future = sut.add(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}
