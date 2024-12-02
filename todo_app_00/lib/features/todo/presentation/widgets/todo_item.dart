import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/todo_model.dart';
import '../cubit/todo_cubit.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todo;

  const TodoItem({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text('${todo.date} at ${todo.time}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(todo.status),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                if (todo.id != null) {
                  context.read<TodoCubit>().deleteTodo(todo.id!);
                }
              },
            ),
          ],
        ),
        onTap: () {
          if (todo.id != null) {
            context.read<TodoCubit>().updateTodo(
                  todo.copyWith(
                    status: todo.status == 'pending' ? 'completed' : 'pending',
                  ),
                );
          }
        },
      ),
    );
  }
}