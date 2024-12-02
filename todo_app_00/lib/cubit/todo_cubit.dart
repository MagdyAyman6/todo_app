import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/todo.dart';
import '../services/database_helper.dart';
import 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  TodoCubit() : super(TodoInitial());

  Future<void> loadTodos() async {
    try {
      emit(TodoLoading());
      final todos = await _databaseHelper.getTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> addTodo(Todo todo) async {
    try {
      await _databaseHelper.insertTodo(todo);
      loadTodos();
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> updateTodo(Todo todo) async {
    try {
      await _databaseHelper.updateTodo(todo);
      loadTodos();
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      await _databaseHelper.deleteTodo(id);
      loadTodos();
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }
}