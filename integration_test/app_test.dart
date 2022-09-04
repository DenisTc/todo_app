import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'test_main.dart' as test_app;

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Add new task', (tester) async {
    final textTask = '${DateTime.now().minute}:${DateTime.now().second}';
    const textFormField = 'Что надо сделать…';
    const textButton = 'СОХРАНИТЬ';

    await test_app.main();
    await tester.pumpAndSettle();

    expect(
        find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithIcon(FloatingActionButton, Icons.add));
    await tester.pumpAndSettle();

    expect(
      find.widgetWithText(TextFormField, textFormField),
      findsOneWidget,
    );

    await tester.enterText(
      find.widgetWithText(TextFormField, textFormField),
      textTask,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(TextButton, textButton));
    await tester.pumpAndSettle();

    final gesture = await tester.startGesture(const Offset(0, 300));
    await gesture.moveBy(const Offset(0, -300));
    await tester.pumpAndSettle();

    expect(find.text(textTask), findsOneWidget);
  });
}
