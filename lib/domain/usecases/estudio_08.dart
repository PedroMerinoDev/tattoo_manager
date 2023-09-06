import '../entities/entities.dart';

abstract class Estudio08 {
  Future<EstudioEntity08> save({
    required int userId01,
    required String nomeEstudio,
    String tipoPessoa,
    String urlLogo,
    String razaoSocial,
    String cnpj,
    String cep,
    String endereco,
    String bairro,
    String estado,
    String cidade,
    String telefone1,
    String telefone2,
    String socialMidia,
    String webSite,
    String email,
    double nota,
    DateTime dataCadastro,
  });
}
