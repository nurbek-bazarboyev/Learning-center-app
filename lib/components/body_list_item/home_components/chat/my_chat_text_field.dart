import 'package:flutter/material.dart';

class MyChatTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyChatTextField(
      {super.key,
        required this.controller,
        required this.hintText,
        required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green)
          ),
          filled: true,
          fillColor: Colors.grey.shade200
      ),
    );
  }
}
