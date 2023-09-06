import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/data/usecases/estudio/estudio.dart';
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
}
