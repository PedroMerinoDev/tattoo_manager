import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class RemoteAddEstudio08 {
  late final HttpClient httpClient;
  late final String url;

  RemoteAddEstudio08({required this.httpClient, required this.url});

  Future<void> save() async {
    await httpClient.request(url: url, method: 'post');
  }
}

abstract class HttpClient {
  Future<void> request({required String url, required String method});
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
    // Configurando o comportamento esperado do HttpClientSpy
    when(() => httpClient.request(url: any(named: 'url'), method: 'post'))
        .thenAnswer((_) async {});

    await sut.save();

    // Verifica se o método request foi chamado com a URL correta
    verify(() => httpClient.request(url: url, method: 'post')).called(1);
  });
}
