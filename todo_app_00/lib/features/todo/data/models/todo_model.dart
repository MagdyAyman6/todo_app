import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final int? id;
  final String title;
  final String date;
  final String time;
  final String status;

  const TodoModel({
    this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'time': time,
      'status': status,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] as int?,
      title: map['title'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      status: map['status'] as String,
    );
  }

  TodoModel copyWith({
    int? id,
    String? title,
    String? date,
    String? time,
    String? status,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      time: time ?? this.time,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [id, title, date, time, status];
}