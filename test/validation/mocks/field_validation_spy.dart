import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/presentation/presentation.dart';
import 'package:tattoo_manager/validation/protocols/protocols.dart';

class FieldValidationSpy extends Mock implements FieldValidation {
  FieldValidationSpy() {
    mockValidation();
    mockFieldName('any_field');
  }

  When mockValidationCall() => when(() => validate(any()));
  void mockValidation() => mockValidationCall().thenReturn(null);
  void mockValidationError(ValidationError error) =>
      mockValidationCall().thenReturn(error);

  void mockFieldName(String fieldName) =>
      when(() => field).thenReturn(fieldName);
}
