import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/todo_cubit.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_form.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TodoForm(
          onSubmit: (Todo todo) {
            context.read<TodoCubit>().addTodo(todo);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}