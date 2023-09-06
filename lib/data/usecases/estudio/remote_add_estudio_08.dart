import 'package:tattoo_manager/data/models/estudio/estudio.dart';
import 'package:tattoo_manager/domain/usecases/estudio/add_estudio_08.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../http/http.dart';

class RemoteAddEstudio08 implements AddEstudio08 {
  final HttpClient httpClient;
  final String url;

  RemoteAddEstudio08({required this.httpClient, required this.url});

  @override
  Future<EstudioEntity08> add(AddEstudio08Params params) async {
    final body = RemoteAddEstudio08Params.fromDomain(params).toJson();
    try {
      final httpResponse =
          await httpClient.request(url: url, method: 'post', body: body);
      return RemoteAddEstudio08Model.fromJson(httpResponse).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.forbidden
          ? DomainError.emailInUse
          : DomainError.unexpected;
    }
  }
}

class RemoteAddEstudio08Params {
  final int userId01;
  final String tipoPessoa;
  final String nomeEstudio;
  final String urlLogo;
  final String razaoSocial;
  final String cnpj;
  final String cep;
  final String endereco;
  final String bairro;
  final String estado;
  final String cidade;
  final String telefone1;
  final String telefone2;
  final String socialMidia;
  final String webSite;
  final String email;
  final double nota;
  final DateTime dataCadastro;

  RemoteAddEstudio08Params({
    required this.userId01,
    required this.tipoPessoa,
    required this.nomeEstudio,
    required this.urlLogo,
    required this.razaoSocial,
    required this.cnpj,
    required this.cep,
    required this.endereco,
    required this.bairro,
    required this.estado,
    required this.cidade,
    required this.telefone1,
    required this.telefone2,
    required this.socialMidia,
    required this.webSite,
    required this.email,
    required this.nota,
    required this.dataCadastro,
  });

  factory RemoteAddEstudio08Params.fromDomain(AddEstudio08Params params) =>
      RemoteAddEstudio08Params(
        userId01: params.userId01,
        tipoPessoa: params.tipoPessoa,
        nomeEstudio: params.nomeEstudio,
        urlLogo: params.urlLogo,
        razaoSocial: params.razaoSocial,
        cnpj: params.cnpj,
        cep: params.cep,
        endereco: params.endereco,
        bairro: params.bairro,
        estado: params.estado,
        cidade: params.cidade,
        telefone1: params.telefone1,
        telefone2: params.telefone2,
        socialMidia: params.socialMidia,
        webSite: params.webSite,
        email: params.email,
        nota: params.nota,
        dataCadastro: params.dataCadastro,
      );

  Map toJson() => {
        'userId01': userId01,
        'tipoPessoa': tipoPessoa,
        'nomeEstudio': nomeEstudio,
        'urlLogo': urlLogo,
        'razaoSocial': razaoSocial,
        'cnpj': cnpj,
        'cep': cep,
        'endereco': endereco,
        'bairro': bairro,
        'estado': estado,
        'cidade': cidade,
        'telefone1': telefone1,
        'telefone2': telefone2,
        'socialMidia': socialMidia,
        'webSite': webSite,
        'email': email,
        'nota': nota,
        'dataCadastro': dataCadastro,
      };
}
