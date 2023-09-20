import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/domain/domain.dart';
import 'package:tattoo_manager/domain/usecases/estudio/add_estudio_08.dart';
import 'package:tattoo_manager/presentation/presentation.dart';
import 'package:tattoo_manager/ui/ui.dart';
import 'package:test/test.dart';

import '../../../domain/mocks/add_estudio_spy.dart';
import '../../../domain/mocks/mocks.dart';
import '../../mocks/mocks.dart';

void main() {
  late GetxEstudioPresenter sut;
  late ValidationSpy validation;
  late AddEstudio08Spy addEstudio;
  late String email;
  late String nomeEstudio;
  late EstudioEntity08 estudio;

  setUp(() {
    email = faker.internet.email();
    nomeEstudio = faker.person.name();
    estudio = EntityFactory.makeEstudio();
    validation = ValidationSpy();
    addEstudio = AddEstudio08Spy();
    addEstudio.mockAddEstudio(estudio);
    sut = GetxEstudioPresenter(
      validation: validation,
      addEstudio: addEstudio,
    );
  });

  setUpAll(() {
    registerFallbackValue(ParamsFactory.makeAddEstudio());
    registerFallbackValue(EntityFactory.makeEstudio());
  });

  test('Should call Validation with correct email', () {
    final Map<String, String?> formData = {
      'nomeEstudio': null,
      'email': email,
    };

    sut.validateEmail(email);

    verify(() => validation.validate(field: 'email', input: formData))
        .called(1);
  });

  test('Should emit invalidFieldError if email is invalid', () {
    validation.mockValidationError(value: ValidationError.invalidField);

    sut.emailErrorStream.listen(
      expectAsync1((UIError? error) => expect(error, UIError.invalidField)),
    );
    sut.isFormValidStream
        .listen(expectAsync1((bool isValid) => expect(isValid, false)));

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should emit requiredFieldError if email is empty', () {
    validation.mockValidationError(value: ValidationError.requiredField);

    sut.emailErrorStream.listen(
      expectAsync1((UIError? error) => expect(error, UIError.requiredField)),
    );
    sut.isFormValidStream
        .listen(expectAsync1((bool isValid) => expect(isValid, false)));

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should emit null if validation succeeds', () {
    sut.emailErrorStream
        .listen(expectAsync1((UIError? error) => expect(error, null)));
    sut.isFormValidStream
        .listen(expectAsync1((bool isValid) => expect(isValid, false)));

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should call Validation with correct nomeEstudio', () {
    final Map<String, String?> formData = {
      'nomeEstudio': nomeEstudio,
      'email': null,
    };

    sut.validateNomeEstudio(nomeEstudio);

    verify(() => validation.validate(field: 'nomeEstudio', input: formData))
        .called(1);
  });

  test('Should emit invalidFieldError if nomeEstudio is invalid', () {
    validation.mockValidationError(value: ValidationError.invalidField);

    sut.nomeEstudioErrorStream.listen(
      expectAsync1((UIError? error) => expect(error, UIError.invalidField)),
    );
    sut.isFormValidStream
        .listen(expectAsync1((bool isValid) => expect(isValid, false)));

    sut.validateNomeEstudio(nomeEstudio);
    sut.validateNomeEstudio(nomeEstudio);
  });

  test('Should emit requiredFieldError if nomeEstudio is empty', () {
    validation.mockValidationError(value: ValidationError.requiredField);

    sut.nomeEstudioErrorStream.listen(
      expectAsync1((UIError? error) => expect(error, UIError.requiredField)),
    );
    sut.isFormValidStream
        .listen(expectAsync1((bool isValid) => expect(isValid, false)));

    sut.validateNomeEstudio(nomeEstudio);
    sut.validateNomeEstudio(nomeEstudio);
  });

  test('Should emit null if validation succeeds', () {
    sut.nomeEstudioErrorStream
        .listen(expectAsync1((UIError? error) => expect(error, null)));
    sut.isFormValidStream
        .listen(expectAsync1((bool isValid) => expect(isValid, false)));

    sut.validateNomeEstudio(nomeEstudio);
    sut.validateNomeEstudio(nomeEstudio);
  });

/*

  test('Should emit null if validation succeeds', () {
    sut.passwordErrorStream
        .listen(expectAsync1((UIError? error) => expect(error, null)));
    sut.isFormValidStream
        .listen(expectAsync1((bool isValid) => expect(isValid, false)));

    sut.validatePassword(password);
    sut.validatePassword(password);
  });
*/

  test(
    'Should enable form button if all fields are valid',
    () async {
      expectLater(sut.isFormValidStream, emitsInOrder([false, true]));
      sut.validateNomeEstudio(nomeEstudio);
      await Future.delayed(Duration.zero);
      sut.validateEmail(email);
      await Future.delayed(Duration.zero);
    },
  );

  test('Should call AddEstudio with correct values', () async {
    sut.validateNomeEstudio(nomeEstudio);
    sut.validateEmail(email);

    await sut.save();

    verify(
      () => addEstudio.add(
        AddEstudio08Params(
          nomeEstudio: nomeEstudio,
          email: email,
          userId01: 0,
          tipoPessoa: 'Pessoa Jurídica',
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
          dataCadastro: DateTime.now(),
        ),
      ),
    ).called(1);
  });

  test('Should emit correct events on AddAccount success', () async {
    sut.validateNomeEstudio(nomeEstudio);
    sut.validateEmail(email);

    expectLater(sut.mainErrorStream, emits(null));
    expectLater(sut.isLoadingStream, emits(true));

    await sut.save();
  });

  test('Should emit correct events on EmailInUseError', () async {
    addEstudio.mockAddEstudioError(DomainError.emailInUse);
    sut.validateNomeEstudio(nomeEstudio);
    sut.validateEmail(email);

    expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
    expectLater(
      sut.mainErrorStream,
      emitsInOrder([null, UIError.emailInUse]),
    );

    await sut.save();
  });

  test('Should emit correct events on UnexpectedError', () async {
    addEstudio.mockAddEstudioError(DomainError.unexpected);
    sut.validateNomeEstudio(nomeEstudio);
    sut.validateEmail(email);

    expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
    expectLater(
      sut.mainErrorStream,
      emitsInOrder([null, UIError.unexpected]),
    );

    await sut.save();
  });

  test('Should change page on success', () async {
    sut.validateNomeEstudio(nomeEstudio);
    sut.validateEmail(email);

    sut.navigateToStream
        .listen(expectAsync1((String? page) => expect(page, '/surveys')));

    await sut.save();
  });
}
