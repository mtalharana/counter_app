// ignore_for_file: prefer_const_constructors

import 'package:counter_app/Todo_app/ui/todo_screen/todo_screen,.dart';
import 'package:counter_app/counter_app/bloc/counter_bloc.dart';
import 'package:counter_app/counter_app/ui/counter_screen.dart';
import 'package:counter_app/image_picker/bloc/image_picker_bloc.dart';
import 'package:counter_app/image_picker/ui/image_picker_screen.dart';
import 'package:counter_app/image_picker/utils/image_picker_utils.dart';
import 'package:counter_app/switch_app/bloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/switch_app/ui/switch_example_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodoScreen(),
      ),
    );
  }
}
