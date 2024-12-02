import 'package:flutter/material.dart';
import '../../data/models/todo_model.dart';
import '../../../../utils/date_time_utils.dart';
import 'form_field_wrapper.dart';

class TodoForm extends StatefulWidget {
  final Function(TodoModel) onSubmit;

  const TodoForm({
    super.key,
    required this.onSubmit,
  });

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  String _selectedDate = '';
  String _selectedTime = '';
  String _status = 'pending';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FormFieldWrapper(
              child: TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
            ),
            FormFieldWrapper(
              child: ElevatedButton(
                onPressed: () async {
                  final date = await DateTimeUtils.pickDate(context);
                  if (date != null) {
                    setState(() => _selectedDate = date);
                  }
                },
                child: Text(_selectedDate.isEmpty ? 'Select Date' : _selectedDate),
              ),
            ),
            if (_selectedDate.isEmpty)
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'Please select a date',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            FormFieldWrapper(
              child: ElevatedButton(
                onPressed: () async {
                  final time = await DateTimeUtils.pickTime(context);
                  if (time != null) {
                    setState(() => _selectedTime = time);
                  }
                },
                child: Text(_selectedTime.isEmpty ? 'Select Time' : _selectedTime),
              ),
            ),
            if (_selectedTime.isEmpty)
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'Please select a time',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            FormFieldWrapper(
              child: DropdownButtonFormField<String>(
                value: _status,
                decoration: const InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(),
                ),
                items: ['pending', 'completed'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() => _status = newValue);
                  }
                },
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false &&
                    _selectedDate.isNotEmpty &&
                    _selectedTime.isNotEmpty) {
                  widget.onSubmit(
                    TodoModel(
                      title: _titleController.text,
                      date: _selectedDate,
                      time: _selectedTime,
                      status: _status,
                    ),
                  );
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Text('Add Todo'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
}