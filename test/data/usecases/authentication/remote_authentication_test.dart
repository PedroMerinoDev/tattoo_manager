import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tattoo_manager/data/http/http.dart';
import 'package:tattoo_manager/data/usecases/usecases.dart';
import 'package:tattoo_manager/domain/helpers/helpers.dart';
import 'package:tattoo_manager/domain/usecases/usecases.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  HttpClientSpy? httpClient;
  RemoteAuthentication? sut;
  String? url;
  AuthenticationParams? params;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpsUrl();
    sut = RemoteAuthentication(httpClient: httpClient!, url: url!);
    params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());
  });

  test('Should call HttpClient with correct values', () async {
    await sut?.auth(params!);

    verify(httpClient!.request(
        url: url!,
        method: 'post',
        body: {'email': params!.email, 'password': params!.secret}));
  });

  test('Should throw UnexpectedError if HttpClient returns 400', () async {
    when(httpClient!.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.badRequest);

    final future = sut?.auth(params!);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    when(httpClient!.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.notFound);

    final future = sut?.auth(params!);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    when(httpClient!.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.serverError);

    final future = sut?.auth(params!);

    expect(future, throwsA(DomainError.unexpected));
  });
}

/*late RemoteAuthentication sut;
  late HttpClientSpy httpClient;
  late String url;
  late AuthenticationParams params;
  late Map apiResult;

  setUp(() {
    params = ParamsFactory.makeAuthentication();
    url = faker.internet.httpUrl();
    apiResult = ApiFactory.makeAccountJson();
    httpClient = HttpClientSpy();
    httpClient.mockRequest(apiResult);
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values', () async {
    await sut.auth(params);

    verify(() => httpClient.request(
      url: url,
      method: 'post',
      body: {'email': params.email, 'password': params.secret}
    ));
  });

  test('Should throw UnexpectedError if HttpClient returns 400', () async {
    httpClient.mockRequestError(HttpError.badRequest);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 404', () async {
    httpClient.mockRequestError(HttpError.notFound);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    httpClient.mockRequestError(HttpError.serverError);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw InvalidCredentialsError if HttpClient returns 401', () async {
    httpClient.mockRequestError(HttpError.unauthorized);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.invalidCredentials));
  });

  test('Should return an Account if HttpClient returns 200', () async {
    final account = await sut.auth(params);

    expect(account.token, apiResult['accessToken']);
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {
    httpClient.mockRequest({'invalid_key': 'invalid_value'});

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });}*/
