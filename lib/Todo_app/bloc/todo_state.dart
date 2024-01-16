import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<String> todos;
  const TodoState({
    this.todos = const <String>[],
  });

  @override
  List<Object> get props => [todos];
}
