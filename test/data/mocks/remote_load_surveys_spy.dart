import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/data/data.dart';
import 'package:tattoo_manager/domain/domain.dart';

class RemoteLoadSurveysSpy extends Mock implements RemoteLoadSurveys {
  When mockLoadCall() => when(() => load());
  void mockLoad(List<SurveyEntity> surveys) =>
      mockLoadCall().thenAnswer((_) async => surveys);
  void mockLoadError(DomainError error) => mockLoadCall().thenThrow(error);
}
