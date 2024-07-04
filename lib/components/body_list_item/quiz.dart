import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hard_work_app/pages/quiz_page.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: QuizScreen())
    ],
    );
  }
}
