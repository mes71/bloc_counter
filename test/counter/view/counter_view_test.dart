import 'package:bloc_counter/counter/counter.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

const _incrementButtonKey = Key('counterView_increment_floatingActionButton');
const _decrementButtonKey = Key('counterView_decrement_floatingActionButton');

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
  late CounterCubit counterCubit;
  setUp(() {
    counterCubit = MockCounterCubit();
  });

  group('Counter view', () {
    testWidgets('render current CounterCubit state', (tester) async {
      when(() => counterCubit.state).thenReturn(42);
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider.value(
          value: counterCubit,
          child: const CounterView(),
        ),
      ));
      expect(find.text('42'), findsOneWidget);
    });

    testWidgets('tapping increment button invokes increment', (tester) async {
      when(() => counterCubit.state).thenReturn(0);
      when(() => counterCubit.increment()).thenReturn(null);

      await tester.pumpWidget(MaterialApp(
        home: BlocProvider.value(
          value: counterCubit,
          child: const CounterView(),
        ),
      ));

      await tester.tap(find.byKey(_incrementButtonKey));

      verify(() => counterCubit.increment()).called(1);
    });

    testWidgets('tap decrement button invokes decrement', (tester) async {
      when(() => counterCubit.state).thenReturn(0);
      when(() => counterCubit.decrement()).thenReturn(null);

      await tester.pumpWidget(MaterialApp(
        home: BlocProvider.value(
          value: counterCubit,
          child: CounterView(),
        ),
      ));

      await tester.tap(find.byKey(_decrementButtonKey));

      verify(() => counterCubit.decrement()).called(1);
    });
  });
}
