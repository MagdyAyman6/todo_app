class Todo {
  final int? id;
  final String title;
  final String date;
  final String time;
  final String status;

  Todo({
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

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      date: map['date'],
      time: map['time'],
      status: map['status'],
    );
  }
}