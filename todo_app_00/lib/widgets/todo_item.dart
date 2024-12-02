import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/todo_cubit.dart';
import 'package:todo_app/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  Todo(
                    id: todo.id,
                    title: todo.title,
                    date: todo.date,
                    time: todo.time,
                    status: todo.status == 'pending' ? 'completed' : 'pending',
                  ),
                );
          }
        },
      ),
    );
  }
}