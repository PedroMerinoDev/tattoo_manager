import 'package:tattoo_manager/main/factories/factories.dart';
import 'package:tattoo_manager/validation/validation.dart';
import 'package:test/test.dart';

void main() {
  test('Should return the correct validations', () {
    final List<FieldValidation> validations = makeLoginValidations();

    expect(validations, [
      const RequiredFieldValidation('email'),
      const EmailValidation('email'),
      const RequiredFieldValidation('password'),
      const MinLengthValidation(field: 'password', size: 3)
    ]);
  });
}
