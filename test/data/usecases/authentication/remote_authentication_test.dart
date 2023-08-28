import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

abstract class HttpClient {
  Future<void> request({required String url}) async {}
}

class RemoteAuthentication {
  HttpClient httpClient;
  String url;

  RemoteAuthentication(this.httpClient, this.url);

  Future<void> auth() async {
    await httpClient.request(url: url);
  }
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  test('Should call HttpClient with correct values', () async {
    final httpClient = HttpClientSpy();
    final url = faker.internet.httpsUrl();
    final sut = RemoteAuthentication(httpClient, url);

    await sut.auth();

    verify(httpClient.request(url: url));
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
