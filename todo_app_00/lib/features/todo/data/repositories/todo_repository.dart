import '../models/todo_model.dart';
import '../../../../core/database/database_service.dart';

class TodoRepository {
  final DatabaseService _databaseService;

  TodoRepository({DatabaseService? databaseService})
      : _databaseService = databaseService ?? DatabaseService();

  Future<List<TodoModel>> getTodos() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('todos');
    return maps.map((map) => TodoModel.fromMap(map)).toList();
  }

  Future<void> addTodo(TodoModel todo) async {
    final db = await _databaseService.database;
    await db.insert('todos', todo.toMap());
  }

  Future<void> updateTodo(TodoModel todo) async {
    final db = await _databaseService.database;
    await db.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteTodo(int id) async {
    final db = await _databaseService.database;
    await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}