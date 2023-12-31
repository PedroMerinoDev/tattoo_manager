import 'package:flutter/material.dart';

import './components.dart';
import '../survey_result.dart';

class SurveyResult extends StatelessWidget {
  final SurveyResultViewModel viewModel;

  final void Function({required String answer}) onSave;

  const SurveyResult(
      {super.key, required this.viewModel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return SurveyHeader(viewModel.question);
        }
        final answer = viewModel.answers[index - 1];
        return GestureDetector(
            onTap: () =>
                answer.isCurrentAnswer ? null : onSave(answer: answer.answer),
            child: SurveyAnswer(answer));
      },
      itemCount: viewModel.answers.length + 1,
    );
  }
}
