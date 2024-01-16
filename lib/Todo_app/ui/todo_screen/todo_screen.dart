import 'package:counter_app/Todo_app/bloc/todo_bloc.dart';
import 'package:counter_app/Todo_app/bloc/todo_event.dart';
import 'package:counter_app/Todo_app/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoAppScreen extends StatefulWidget {
  const TodoAppScreen({super.key});

  @override
  State<TodoAppScreen> createState() => _TodoAppScreenState();
}

class _TodoAppScreenState extends State<TodoAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo Screen'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<TodoBloc>().add(
                AddTodoEvent('Todo ${DateTime.now().millisecondsSinceEpoch}'));
          },
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state.todos.isEmpty) {
              return const Center(
                child: Text('No Todos'),
              );
            } else {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todos[index]),
                  );
                },
              );
            }
          },
        ));
  }
}
