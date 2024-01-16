import 'package:bloc/bloc.dart';
import 'package:counter_app/Todo_app/bloc/todo_event.dart';
import 'package:counter_app/Todo_app/bloc/todo_state.dart';
import 'package:equatable/equatable.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<TodoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
