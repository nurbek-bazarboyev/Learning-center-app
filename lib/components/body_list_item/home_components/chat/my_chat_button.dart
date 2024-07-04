import 'package:flutter/material.dart';

class MyChatButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyChatButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black
        ),
        child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
