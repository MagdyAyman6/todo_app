import 'package:flutter/material.dart';

import '../networking/database.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.teal,
      child: const Icon(Icons.edit),
      onPressed: () {
        LocalDatabase.insertDatabase(
                title: "go to club",
                date: "2024-01-01",
                time: "02.00",
                status: "new")
            .then((onValue) {
          setState(() {});
        });
      },
    );
  }
}
