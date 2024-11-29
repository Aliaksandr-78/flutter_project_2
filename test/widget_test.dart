import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project_2/main.dart';

void main() {
  testWidgets('Theme toggles on button press', (WidgetTester tester) async {
    await tester.pumpWidget(MyDiaryApp());

    expect(
      find.byWidgetPredicate((widget) =>
          widget is MaterialApp && widget.theme == ThemeData.light()),
      findsOneWidget,
    );

    final toggleButton = find.byIcon(Icons.brightness_6);

    await tester.tap(toggleButton);
    await tester.pump();

    expect(
      find.byWidgetPredicate((widget) =>
          widget is MaterialApp && widget.theme == ThemeData.dark()),
      findsOneWidget,
    );
  });
}
