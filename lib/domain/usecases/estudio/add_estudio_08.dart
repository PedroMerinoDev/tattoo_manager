import 'package:equatable/equatable.dart';

import '../../entities/estudio/estudio.dart';

abstract class AddEstudio08 {
  Future<EstudioEntity08> add(AddEstudio08Params params);
}

class AddEstudio08Params extends Equatable {
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

  @override
  List<Object?> get props => [
        userId01,
        tipoPessoa,
        nomeEstudio,
        urlLogo,
        razaoSocial,
        cnpj,
        cep,
        endereco,
        bairro,
        estado,
        cidade,
        telefone1,
        telefone2,
        socialMidia,
        webSite,
        email,
        nota,
        dataCadastro,
      ];

  const AddEstudio08Params({
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
}
