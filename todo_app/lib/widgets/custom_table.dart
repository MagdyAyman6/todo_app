// import 'package:flutter/material.dart';
//
// class CustomTable extends StatelessWidget {
//   final String title;
//   final List<String> tasks;
//   final Function(String) onAddTask;
//   final Function(int) onDeleteTask;
//
//   const CustomTable({
//     super.key,
//     required this.title,
//     required this.tasks,
//     required this.onAddTask,
//     required this.onDeleteTask,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController taskController = TextEditingController();
//
//     return ;
//   }
// }
//
// // Container(
// // decoration: BoxDecoration(
// // color: Colors.white,
// // borderRadius: BorderRadius.circular(15),
// // boxShadow: [
// // BoxShadow(
// // color: Colors.grey.withOpacity(0.5),
// // blurRadius: 10,
// // offset: const Offset(0, 5),
// // ),
// // ],
// // ),
// // child: Column(
// // children: [
// // // Header Section
// // Padding(
// // padding: const EdgeInsets.all(12.0),
// // child: Text(
// // title,
// // style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// // ),
// // ),
// // const Divider(),
// //
// // // Task List Section
// // Expanded(
// // child: ListView.builder(
// // itemCount: tasks.length,
// // itemBuilder: (context, index) {
// // return ListTile(
// // leading: const Icon(Icons.check_circle_outline),
// // title: Text(tasks[index]),
// // trailing: IconButton(
// // icon: const Icon(Icons.delete, color: Colors.red),
// // // onPressed: () => onDeleteTask(index),
// // ),
// // );
// // },
// // ),
// // ),
// //
// // // Add Task Section
// // Padding(
// // padding: const EdgeInsets.all(12.0),
// // child: Row(
// // children: [
// // Expanded(
// // child: TextField(
// // controller: taskController,
// // decoration: InputDecoration(
// // hintText: 'Add a new task',
// // border: OutlineInputBorder(
// // borderRadius: BorderRadius.circular(8),
// // ),
// // ),
// // ),
// // ),
// // const SizedBox(width: 10),
// // ElevatedButton(
// // onPressed: () {
// // if (taskController.text.isNotEmpty) {
// // onAddTask(taskController.text);
// // taskController.clear();
// // }
// // },
// // child: const Text('Add'),
// // ),
// // ],
// // ),
// // ),
// // ],
// // ),
// // )
