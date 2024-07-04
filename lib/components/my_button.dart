import 'package:flutter/material.dart';
class MyButton extends StatefulWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, this.onTap});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black
        ),
        child: Center(
          child: Text(widget.text,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
