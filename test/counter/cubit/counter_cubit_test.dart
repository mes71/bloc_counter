import 'package:bloc_counter/counter/counter.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('counterCubit initial', () {
    test(' initial state must be 0', () {
      expect(CounterCubit().state, 0);
    });
  });

  group('Counter cubit increment', () {
    blocTest(
      'emit [1] when state is 0 ',
      build: () => CounterCubit(),
      act: (bloc) => bloc.increment(),
      expect: () => [1],
    );

    blocTest(
      'emit [1,2] when state is 0',
      build: () => CounterCubit(),
      act: (bloc) => bloc
        ..increment()
        ..increment(),
      expect: () => [1, 2],
    );

    blocTest(
      'emit [49] when state  is 48',
      build: () => CounterCubit(),
      seed: () => 48,
      act: (bloc) => bloc.increment(),
      expect: () => [49],
    );

    blocTest(
      'emit [49,50] when state  is 48',
      build: () => CounterCubit(),
      seed: () => 48,
      act: (bloc) => bloc
        ..increment()
        ..increment(),
      expect: () => [49, 50],
    );
  });
  group('Counter cubit decrement', () {
    blocTest(
      'emit [-1] when state is 0 ',
      build: () => CounterCubit(),
      act: (bloc) => bloc.decrement(),
      expect: () => [-1],
    );

    blocTest(
      'emit [-1,-2] when state is 0',
      build: () => CounterCubit(),
      act: (bloc) => bloc
        ..decrement()
        ..decrement(),
      expect: () => [-1, -2],
    );

    blocTest(
      'emit [49] when state  is 50',
      build: () => CounterCubit(),
      seed: () => 50,
      act: (bloc) => bloc.decrement(),
      expect: () => [49],
    );

    blocTest(
      'emit [49,48] when state  is 50',
      build: () => CounterCubit(),
      seed: () => 50,
      act: (bloc) => bloc
        ..decrement()
        ..decrement(),
      expect: () => [49, 48],
    );
  });
}
