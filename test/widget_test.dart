import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:conceptalive/main.dart';

void main() {
  testWidgets('ConceptAlive app renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const ConceptAliveApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.byType(Scaffold), findsWidgets);
  });
}
