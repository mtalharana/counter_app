import 'package:counter_app/switch_app/bloc/switch_bloc.dart';
import 'package:counter_app/switch_app/bloc/switch_event.dart';
import 'package:counter_app/switch_app/bloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwithExampleScreen extends StatefulWidget {
  const SwithExampleScreen({super.key});

  @override
  State<SwithExampleScreen> createState() => _SwithExampleScreenState();
}

class _SwithExampleScreenState extends State<SwithExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const Text('Switch'),
              const SizedBox(width: 20),
              BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) {
                return previous.isSwitched != current.isSwitched;
              }, builder: (context, state) {
                print('isSwitched: ${state.isSwitched}');
                return Switch(
                  value: state.isSwitched,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(ToggleNotification());
                  },
                );
              }),
            ],
          ),
          const SizedBox(height: 20),
          BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
            return Container(
              width: 200,
              height: 200,
              color: Colors.blue.withOpacity(state.sliderValue),
            );
          }),
          BlocBuilder<SwitchBloc, SwitchState>(buildWhen: (previous, current) {
            return previous.sliderValue != current.sliderValue;
          }, builder: (context, state) {
            print('sliderValue: ${state.sliderValue}');
            return Slider(
              value: state.sliderValue,
              onChanged: (value) {
                context
                    .read<SwitchBloc>()
                    .add(UpdateSliderValueEvent(sliderValue: value.toDouble()));
              },
            );
          }),
        ],
      ),
    );
  }
}
