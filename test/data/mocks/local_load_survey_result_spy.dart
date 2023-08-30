import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/data/data.dart';
import 'package:tattoo_manager/domain/domain.dart';

class LocalLoadSurveyResultSpy extends Mock implements LocalLoadSurveyResult {
  LocalLoadSurveyResultSpy() {
    mockValidate();
    mockSave();
  }

  When mockLoadCall() =>
      when(() => loadBySurvey(surveyId: any(named: 'surveyId')));
  void mockLoad(SurveyResultEntity surveyResult) =>
      mockLoadCall().thenAnswer((_) async => surveyResult);
  void mockLoadError() => mockLoadCall().thenThrow(DomainError.unexpected);

  When mockValidateCall() => when(() => validate(any()));
  void mockValidate() => mockValidateCall().thenAnswer((_) async => _);
  void mockValidateError() => mockValidateCall().thenThrow(Exception());

  When mockSaveCall() => when(() => save(any()));
  void mockSave() => mockSaveCall().thenAnswer((_) async => _);
  void mockSaveError() => mockSaveCall().thenThrow(Exception());
}
