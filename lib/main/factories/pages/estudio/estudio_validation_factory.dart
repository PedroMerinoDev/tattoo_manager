import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../builders/builders.dart';
import '../../../composites/composites.dart';

Validation makeEstudioValidation() =>
    ValidationComposite(makeEstudioValidations());

List<FieldValidation> makeEstudioValidations() => [
      ...ValidationBuilder.field('name').required().min(3).build(),
      ...ValidationBuilder.field('email').required().email().build(),
    ];
