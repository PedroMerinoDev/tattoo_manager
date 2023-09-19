import '../../../domain/entities/entities.dart';
import '../../http/http_error.dart';

class RemoteAddEstudioModel08 {
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

  RemoteAddEstudioModel08({
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

  factory RemoteAddEstudioModel08.fromJson(Map json) {
    if (!json.containsKey('userId01') && !json.containsKey('tipoPessoa')) {
      throw HttpError.invalidData;
    }
    return RemoteAddEstudioModel08(
      userId01: json['userId01'],
      tipoPessoa: json['tipoPessoa'],
      nomeEstudio: json['nomeEstudio'],
      urlLogo: json['urlLogo'],
      razaoSocial: json['razaoSocial'],
      cnpj: json['cnpj'],
      cep: json['cep'],
      endereco: json['endereco'],
      bairro: json['bairro'],
      estado: json['estado'],
      cidade: json['cidade'],
      telefone1: json['telefone1'],
      telefone2: json['telefone2'],
      socialMidia: json['socialMidia'],
      webSite: json['webSite'],
      email: json['email'],
      nota: json['nota'],
      dataCadastro: DateTime.parse(json['dataCadastro']),
    );
  }

  EstudioEntity08 toEntity() => EstudioEntity08(
        userId01:
            userId01, // Usando userId01 como id na entidade, você pode ajustar conforme necessário
        tipoPessoa: tipoPessoa,
        nomeEstudio: nomeEstudio,
        urlLogo: urlLogo,
        razaoSocial: razaoSocial,
        cnpj: cnpj,
        cep: cep,
        endereco: endereco,
        bairro: bairro,
        estado: estado,
        cidade: cidade,
        telefone1: telefone1,
        telefone2: telefone2,
        socialMidia: socialMidia,
        webSite: webSite,
        email: email,
        nota: nota,
        dataCadastro: dataCadastro,
      );
}
