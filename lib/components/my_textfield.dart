import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller; // = TextEditingController();
  final String text;
  final bool obscureText;

  MyTextField(
      {super.key,
      required this.controller,
      required this.text,
      required this.obscureText});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          hintText: widget.text,
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(5)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(5))),
    );
  }
}
