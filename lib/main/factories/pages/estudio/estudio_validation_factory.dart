import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../builders/builders.dart';
import '../../../composites/composites.dart';

Validation makeEstudioValidation() =>
    ValidationComposite(makeEstudioValidations());

List<FieldValidation> makeEstudioValidations() => [
      ...ValidationBuilder.field('nomeEstudio').required().build(),
      ...ValidationBuilder.field('email').required().email().build(),
    ];
