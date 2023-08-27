import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<DecrementEvent>(decrementEvent);
    on<IncrementEvent>(incrementEvent);
  }

  FutureOr<void> decrementEvent(DecrementEvent event, Emitter<CounterState> emit) {
    print('Decrement button clicked');
    emit(CounterState(counter: state.counter-1));
  }

  FutureOr<void> incrementEvent(IncrementEvent event, Emitter<CounterState> emit) {
    print('Increment button clicked');
    emit(CounterState(counter: state.counter+1));
  }
}
