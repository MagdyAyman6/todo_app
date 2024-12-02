import 'package:flutter/material.dart';
import '../../data/models/todo_model.dart';
import 'todo_item.dart';

class TodoList extends StatelessWidget {
  final List<TodoModel> todos;

  const TodoList({
    super.key,
    required this.todos,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return TodoItem(todo: todos[index]);
      },
    );
  }
}