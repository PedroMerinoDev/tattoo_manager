import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tattoo_manager/ui/pages/estudio/estudio_page.dart';
import 'package:tattoo_manager/ui/ui.dart';

import '../../helpers/helpers.dart';
import '../../mocks/estudio/estudio_presenter_spy.dart';

void main() {
  late EstudioPresenterSpy presenter;

  Future<void> loadPage(WidgetTester tester) async {
    presenter = EstudioPresenterSpy();
    await tester.pumpWidget(
      makePage(path: '/estudio', page: () => EstudioPage(presenter)),
    );
  }

  tearDown(() {
    presenter.dispose();
  });

  testWidgets('Should call validate with correct values',
      (WidgetTester tester) async {
    await loadPage(tester);

    final String name = faker.person.name();
    await tester.enterText(find.bySemanticsLabel('Nome'), name);
    verify(() => presenter.validateNomeEstudio(name));

    final String email = faker.internet.email();
    await tester.enterText(find.bySemanticsLabel('Email'), email);
    verify(() => presenter.validateEmail(email));
  });

  testWidgets('Should present email error', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitEmailError(UIError.invalidField);
    await tester.pump();
    expect(find.text('Campo inválido'), findsOneWidget);

    presenter.emitEmailError(UIError.requiredField);
    await tester.pump();
    expect(find.text('Campo obrigatório'), findsOneWidget);

    presenter.emitEmailValid();
    await tester.pump();
    expect(
      find.descendant(
        of: find.bySemanticsLabel('Email'),
        matching: find.byType(Text),
      ),
      findsOneWidget,
    );
  });

  testWidgets('Should present name error', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitNameError(UIError.invalidField);
    await tester.pump();
    expect(find.text('Campo inválido'), findsOneWidget);

    presenter.emitNameError(UIError.requiredField);
    await tester.pump();
    expect(find.text('Campo obrigatório'), findsOneWidget);

    presenter.emitNameValid();
    await tester.pump();
    expect(
      find.descendant(
        of: find.bySemanticsLabel('Nome'),
        matching: find.byType(Text),
      ),
      findsOneWidget,
    );
  });

  testWidgets('Should enable button if form is valid',
      (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitFormValid();
    await tester.pump();

    final ElevatedButton button =
        tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.onPressed, isNotNull);
  });

  testWidgets('Should disable button if form is invalid',
      (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitFormError();
    await tester.pump();

    final ElevatedButton button =
        tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.onPressed, null);
  });

  testWidgets('Should call save on form submit', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitFormValid();
    await tester.pump();
    final Finder button = find.byType(ElevatedButton);
    await tester.ensureVisible(button);
    await tester.tap(button);
    await tester.pump();

    verify(() => presenter.save()).called(1);
  });

  testWidgets('Should handle loading correctly', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitLoading();
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    presenter.emitLoading(false);
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsNothing);

    presenter.emitLoading();
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Should present error message if signUp fails',
      (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitMainError(UIError.emailInUse);
    await tester.pump();

    expect(find.text('O email já está em uso.'), findsOneWidget);
  });

  testWidgets('Should present error message if signUp throws',
      (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitMainError(UIError.unexpected);
    await tester.pump();

    expect(
      find.text('Algo errado aconteceu. Tente novamente em breve.'),
      findsOneWidget,
    );
  });

  testWidgets('Should change page', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitNavigateTo('/any_route');
    await tester.pumpAndSettle();

    expect(currentRoute, '/any_route');
    expect(find.text('fake page'), findsOneWidget);
  });

  testWidgets('Should not change page', (WidgetTester tester) async {
    await loadPage(tester);

    presenter.emitNavigateTo('');
    await tester.pump();
    expect(currentRoute, '/estudio');
  });
}