import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hard_work_app/components/model/questions.dart';
import 'package:hard_work_app/pages/home_page.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (_) => HomePage()
        ), (route) => false);}, icon: Icon(CupertinoIcons.back,color: Colors.white,)),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),
                onPressed: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (_) => HomePage()
            ), (route) => false);}, child: Text("Go Home Screen",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700
            ),)),
            const Text(
              'Your Score: ',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: score / 9,
                    color: Colors.green,
                    backgroundColor: Colors.white.withOpacity(.2),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "${score.toString()}/${questions.length}",
                      style: const TextStyle(fontSize: 60,color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${(score / questions.length * 100).round()}%',
                      style: const TextStyle(fontSize: 25,color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}