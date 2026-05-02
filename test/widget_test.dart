import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_testing_app/main.dart';

void main() {
  testWidgets('Test 1: Button appears on screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final button = find.widgetWithText(ElevatedButton, 'Submit');
    expect(button, findsOneWidget);
  });

  testWidgets('Test 2: Text input works correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    final textField = find.byType(TextField);
    await tester.enterText(textField, 'Hello Teacher');

    final button = find.widgetWithText(ElevatedButton, 'Submit');
    await tester.tap(button);
    await tester.pump();

    final displayedText = find.text('Hello Teacher').last;
    expect(displayedText, findsOneWidget);
  });

  testWidgets('Test 3: Navigation works correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    final navButton = find.widgetWithText(ElevatedButton, 'Go to Next Page');
    await tester.tap(navButton);
    await tester.pumpAndSettle();

    expect(find.text('You navigated successfully!'), findsOneWidget);
  });
}
