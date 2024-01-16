import 'package:bloc/bloc.dart';
import 'package:counter_app/counter_app/bloc/counter_event.dart';
import 'package:counter_app/counter_app/bloc/counter_state.dart';


class CounterBloc extends Bloc<CounterEvent,CounterState >{
  CounterBloc(): super(CounterState()){
    on<IncrementCounter>(_onIncrement);
    on<DecrementCounter>(_onDecrement);


  }
  void _onIncrement(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }
  void _onDecrement(DecrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
  
 

 
}