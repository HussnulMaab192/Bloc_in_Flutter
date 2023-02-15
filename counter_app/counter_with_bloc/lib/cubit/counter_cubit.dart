import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterStates {
  initial,
  increment,
  decrement,
  clear,
}

int counter = 0;

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterStates.initial);

  int get getCounter {
    return counter;
  }

  void incrementCounter() {
    counter = getCounter + 1;
    emit(CounterStates.increment);
  }

  void decrementCounter() {
    counter = getCounter - 1;
    emit(CounterStates.decrement);
  }

  void clearCounter() {
    counter = 0;
    emit(CounterStates.clear);
  }
}
