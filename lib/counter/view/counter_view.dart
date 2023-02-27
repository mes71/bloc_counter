import 'package:bloc_counter/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter Example'),
        centerTitle: true,
      ),
      body: Center(child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Text(
            '$state',
            style: textTheme.displayLarge,
          );
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
              key: const Key('counterView_increment_floatingActionButton'),
              child: const Icon(Icons.add),
              onPressed: () {
                context.read<CounterCubit>().increment();
              }),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              key: const Key('counterView_decrement_floatingActionButton'),
              child: const Icon(Icons.minimize),
              onPressed: () {
                context.read<CounterCubit>().decrement();
              }),
        ],
      ),
    );
  }
}
