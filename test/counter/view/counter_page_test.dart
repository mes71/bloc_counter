import 'package:bloc_counter/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('counter page', () {
    testWidgets('render counter page', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CounterPage(),
      ));
      expect(find.byType(CounterView), findsOneWidget);
    });
  });
}
