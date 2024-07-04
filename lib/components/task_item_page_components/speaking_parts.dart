import 'package:flutter/material.dart';
import 'package:hard_work_app/components/model/speaking_questions_model.dart';

class PartOfSpeaking extends StatelessWidget {
  final int part;
  const PartOfSpeaking({super.key, required this.part});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        color: Colors.orangeAccent.withOpacity(.1),
        child: ListView.builder(
            itemBuilder: (context, index){
              List<String> title = parts[part]!["question"]!.keys.toList();
              List<String> quesTitle = parts[part]!["question"]![title[index]]!;
              return ExpansionTile(
                  title: Text("${index+1}) ${title[index]}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                  children: [
                    Container(
                      color: Colors.orangeAccent.withOpacity(.2),
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      height: size.height * .5,
                      child: ListView.builder(
                        itemCount: quesTitle.length,
                        itemBuilder: (context,each)=>Text("${each+1}. ${quesTitle[each]}\n",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),),
                    ),

                  ]

              );
            },
            itemCount: parts[part]!["question"]!.length),
      ),
    );
  }
}
