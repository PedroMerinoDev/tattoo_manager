import 'package:get/get.dart';
import 'package:tattoo_manager/domain/usecases/estudio/add_estudio_08.dart';
import 'package:tattoo_manager/ui/pages/estudio/estudio_presenter.dart';

import '../../domain/helpers/helpers.dart';
import '../../ui/helpers/helpers.dart';
import '../mixins/mixins.dart';
import '../protocols/protocols.dart';

class GetxEstudioPresenter extends GetxController
    with LoadingManager, NavigationManager, FormManager, UIErrorManager
    implements EstudioPresenter {
  final Validation validation;
  final AddEstudio08 addEstudio;

  final _emailError = Rx<UIError?>(null);
  final _nameError = Rx<UIError?>(null);

  String? _name;
  String? _email;

  @override
  Stream<UIError?> get emailErrorStream => _emailError.stream;

  @override
  Stream<UIError?> get nameErrorStream => _nameError.stream;

  GetxEstudioPresenter({required this.validation, required this.addEstudio});

  @override
  void validateEmail(String email) {
    _email = email;
    _emailError.value = _validateField('email');
    _validateForm();
  }

  @override
  void validateName(String name) {
    _name = name;
    _nameError.value = _validateField('name');
    _validateForm();
  }

  UIError? _validateField(String field) {
    final formData = {
      'name': _name,
      'email': _email,
    };
    final error = validation.validate(field: field, input: formData);
    switch (error) {
      case ValidationError.invalidField:
        return UIError.invalidField;
      case ValidationError.requiredField:
        return UIError.requiredField;
      default:
        return null;
    }
  }

  void _validateForm() {
    isFormValid = _emailError.value == null &&
        _nameError.value == null &&
        _name != null &&
        _email != null;
  }

  @override
  Future<void> save() async {
    try {
      mainError = null;
      isLoading = true;
      await addEstudio.add(AddEstudio08Params(
        nomeEstudio: _name!,
        email: _email!,
        userId01: 1,
        tipoPessoa: '',
        urlLogo: '',
        razaoSocial: '',
        cnpj: '',
        cep: '',
        endereco: '',
        bairro: '',
        estado: '',
        cidade: '',
        telefone1: '',
        telefone2: '',
        socialMidia: '',
        webSite: '',
        nota: 0,
        dataCadastro: DateTime(2023),
      ));
      navigateTo = '/surveys';
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.emailInUse:
          mainError = UIError.emailInUse;
          break;
        default:
          mainError = UIError.unexpected;
          break;
      }
      isLoading = false;
    }
  }
}
