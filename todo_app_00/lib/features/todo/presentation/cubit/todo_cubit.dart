import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/todo_model.dart';
import '../../data/repositories/todo_repository.dart';
import 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository _repository;

  TodoCubit({TodoRepository? repository})
      : _repository = repository ?? TodoRepository(),
        super(TodoInitial());

  Future<void> loadTodos() async {
    try {
      emit(TodoLoading());
      final todos = await _repository.getTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> addTodo(TodoModel todo) async {
    try {
      await _repository.addTodo(todo);
      await loadTodos();
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> updateTodo(TodoModel todo) async {
    try {
      await _repository.updateTodo(todo);
      await loadTodos();
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      await _repository.deleteTodo(id);
      await loadTodos();
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }
}