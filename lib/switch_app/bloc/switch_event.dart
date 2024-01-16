import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable {
  const SwitchEvents();

  @override
  List<Object> get props => [];
}

class ToggleNotification extends SwitchEvents {}

class UpdateSliderValueEvent extends SwitchEvents {
  final double sliderValue;

  const UpdateSliderValueEvent({required this.sliderValue});

  @override
  List<Object> get props => [sliderValue];
}
