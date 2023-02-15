import 'package:counter_with_bloc/bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitialState()) {
    on<IncrementEvent>((event, emit) => emit(IncrementState()));
    on<DecrementEvent>((event, emit) => emit(DecrementState()));
    on<ClearEvent>((event, emit) {
      counter = 0;
      emit(ClearState());
    });
  }
}
