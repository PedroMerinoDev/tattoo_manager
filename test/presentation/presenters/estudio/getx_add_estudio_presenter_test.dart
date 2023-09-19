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
  late String name;
  late EstudioEntity08 estudio;

  setUp(() {
    email = faker.internet.email();
    name = faker.person.name();
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
      'name': null,
      'email': email,
      'password': null,
      'passwordConfirmation': null
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

  test('Should call Validation with correct name', () {
    final Map<String, String?> formData = {
      'name': name,
      'email': null,
      'password': null,
      'passwordConfirmation': null
    };

    sut.validateName(name);

    verify(() => validation.validate(field: 'name', input: formData)).called(1);
  });

  test('Should emit invalidFieldError if name is invalid', () {
    validation.mockValidationError(value: ValidationError.invalidField);

    sut.nameErrorStream.listen(
      expectAsync1((UIError? error) => expect(error, UIError.invalidField)),
    );
    sut.isFormValidStream
        .listen(expectAsync1((bool isValid) => expect(isValid, false)));

    sut.validateName(name);
    sut.validateName(name);
  });

  test('Should emit requiredFieldError if name is empty', () {
    validation.mockValidationError(value: ValidationError.requiredField);

    sut.nameErrorStream.listen(
      expectAsync1((UIError? error) => expect(error, UIError.requiredField)),
    );
    sut.isFormValidStream
        .listen(expectAsync1((bool isValid) => expect(isValid, false)));

    sut.validateName(name);
    sut.validateName(name);
  });

  test('Should emit null if validation succeeds', () {
    sut.nameErrorStream
        .listen(expectAsync1((UIError? error) => expect(error, null)));
    sut.isFormValidStream
        .listen(expectAsync1((bool isValid) => expect(isValid, false)));

    sut.validateName(name);
    sut.validateName(name);
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
      sut.validateName(name);
      await Future.delayed(Duration.zero);
      sut.validateEmail(email);
      await Future.delayed(Duration.zero);
    },
  );

  test('Should call AddEstudio with correct values', () async {
    sut.validateName(name);
    sut.validateEmail(email);

    await sut.save();

    verify(
      () => addEstudio.add(
        AddEstudio08Params(
          nomeEstudio: name,
          email: email,
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
          dataCadastro: DateTime.now(),
        ),
      ),
    ).called(1);
  });

  test('Should emit correct events on AddAccount success', () async {
    sut.validateName(name);
    sut.validateEmail(email);

    expectLater(sut.mainErrorStream, emits(null));
    expectLater(sut.isLoadingStream, emits(true));

    await sut.save();
  });

  test('Should emit correct events on EmailInUseError', () async {
    addEstudio.mockAddEstudioError(DomainError.emailInUse);
    sut.validateName(name);
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
    sut.validateName(name);
    sut.validateEmail(email);

    expectLater(sut.isLoadingStream, emitsInOrder([true, false]));
    expectLater(
      sut.mainErrorStream,
      emitsInOrder([null, UIError.unexpected]),
    );

    await sut.save();
  });

  test('Should change page on success', () async {
    sut.validateName(name);
    sut.validateEmail(email);

    sut.navigateToStream
        .listen(expectAsync1((String? page) => expect(page, '/surveys')));

    await sut.save();
  });
}
