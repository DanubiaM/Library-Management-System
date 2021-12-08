import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextInputType? inputType;
  final TextEditingController textInputController;

  TextInput(
      {required this.icon,
      required this.placeholder,
      required this.textInputController,
      this.inputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[600]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          style: TextStyle(color: Colors.white),
          controller: textInputController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            border: InputBorder.none,
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.white),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          keyboardType: inputType,
          cursorColor: Colors.white,
        ),
      ),
    );
  }
}
