import 'package:bloc/bloc.dart';
import 'package:bloc_counter/app.dart';
import 'package:bloc_counter/counter_bloc_observer.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = CounterBlocObserver();
  runApp(CounterApp());
}
