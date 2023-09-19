import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/domain/domain.dart';
import 'package:tattoo_manager/domain/usecases/estudio/add_estudio_08.dart';

class AddEstudio08Spy extends Mock implements AddEstudio08 {
  When mockAddEstudioCall() => when(() => add(any()));
  void mockAddEstudio(EstudioEntity08 data) =>
      mockAddEstudioCall().thenAnswer((_) async => data);
  void mockAddEstudioError(DomainError error) =>
      mockAddEstudioCall().thenThrow(error);
}
