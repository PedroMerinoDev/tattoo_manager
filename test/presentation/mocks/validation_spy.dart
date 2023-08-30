import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/presentation/protocols/validation.dart';

class ValidationSpy extends Mock implements Validation {
  ValidationSpy() {
    mockValidation();
  }

  When mockValidationCall(String? field) => when(
        () => validate(
          field: field ?? any(named: 'field'),
          input: any(named: 'input'),
        ),
      );
  void mockValidation({String? field}) =>
      mockValidationCall(field).thenReturn(null);
  void mockValidationError({required ValidationError value, String? field}) =>
      mockValidationCall(field).thenReturn(value);
}
