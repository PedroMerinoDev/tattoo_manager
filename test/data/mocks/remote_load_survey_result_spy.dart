import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/data/data.dart';
import 'package:tattoo_manager/domain/domain.dart';

class RemoteLoadSurveyResultSpy extends Mock implements RemoteLoadSurveyResult {
  When mockLoadCall() =>
      when(() => loadBySurvey(surveyId: any(named: 'surveyId')));
  void mockLoad(SurveyResultEntity surveyResult) =>
      mockLoadCall().thenAnswer((_) async => surveyResult);
  void mockLoadError(DomainError error) => mockLoadCall().thenThrow(error);
}
