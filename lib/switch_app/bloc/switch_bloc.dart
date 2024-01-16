import 'package:counter_app/switch_app/bloc/switch_event.dart';
import 'package:counter_app/switch_app/bloc/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<ToggleNotification>(_onToggleNotification);
    on<UpdateSliderValueEvent>(_onUpdateSliderValueEvent);
  }
  void _onToggleNotification(
      ToggleNotification event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitched: !state.isSwitched));
  }

  void _onUpdateSliderValueEvent(
      UpdateSliderValueEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(sliderValue: event.sliderValue));
  }
}
