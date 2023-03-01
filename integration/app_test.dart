import 'package:bloc_counter/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterApp', () {
    testWidgets('render Correct App bar text', (tester) async {
      await tester.pumpApp();
      expect(find.text('Bloc Counter Example'), findsOneWidget);
    });

    testWidgets('render correct initial count', (tester) async {
      await tester.pumpApp();
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('tapping increment button update the count', (tester) async {
      await tester.pumpApp();

      for (int i = 0; i < 10; i++) {
        await tester.incrementCounter();
        expect(find.text('${i + 1}'), findsOneWidget);
      }
    });

    testWidgets('tapping ', (tester) async {
      await tester.pumpApp();
      for (int i = 0; i <= 10; i++) {
        await tester.decrementCounter();
        expect(find.text('${-(i + 1)}'), findsOneWidget);
      }
    });
  });
}

extension on WidgetTester {
  Future<void> pumpApp() async {
    app.main();
    await pumpAndSettle();
  }

  Future<void> incrementCounter() async {
    await tap(
        find.byKey(const Key('counterView_increment_floatingActionButton')));
    await pump();
  }

  Future<void> decrementCounter() async {
    await tap(
        find.byKey(const Key('counterView_decrement_floatingActionButton')));
    await pump();
  }
}
