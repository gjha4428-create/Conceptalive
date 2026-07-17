import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:conceptalive/main.dart';

void main() {
  testWidgets('ConceptAlive app renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const ConceptAliveApp());

    // Verify app starts
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // Give time for navigation to complete
    await tester.pumpAndSettle(const Duration(seconds: 3));
    
    // Verify we can find content
    expect(find.byType(Scaffold), findsWidgets);
  });
}
