import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static Future<String?> pickDate(BuildContext context) async {
    try {
      final DateTime? picked = await DatePicker.showDatePicker(
        context,
        currentTime: DateTime.now(),
        minTime: DateTime.now(),
        maxTime: DateTime.now().add(const Duration(days: 365)),
        locale: LocaleType.en,
      );
      
      if (picked != null) {
        return DateFormat('yyyy-MM-dd').format(picked);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error picking date'),
          backgroundColor: Colors.red,
        ),
      );
    }
    return null;
  }

  static Future<String?> pickTime(BuildContext context) async {
    try {
      final DateTime? picked = await DatePicker.showTimePicker(
        context,
        currentTime: DateTime.now(),
        locale: LocaleType.en,
      );
      
      if (picked != null) {
        return DateFormat('HH:mm').format(picked);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error picking time'),
          backgroundColor: Colors.red,
        ),
      );
    }
    return null;
  }
}