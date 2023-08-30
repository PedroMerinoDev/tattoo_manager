import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/domain/domain.dart';

class LoadSurveyResultSpy extends Mock implements LoadSurveyResult {
  When mockLoadCall() =>
      when(() => loadBySurvey(surveyId: any(named: 'surveyId')));
  void mockLoad(SurveyResultEntity surveyResult) =>
      mockLoadCall().thenAnswer((_) async => surveyResult);
  void mockLoadError(DomainError error) => mockLoadCall().thenThrow(error);
}
