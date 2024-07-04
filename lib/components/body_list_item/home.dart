import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hard_work_app/components/home_item.dart';
import 'package:hard_work_app/pages/chat_pages/chat_home.dart';
import 'package:hard_work_app/pages/recommended_books.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 10,),
        // recommended books
        InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RecommendedBooks()));
          },
          child: SizedBox(
            height: 200,
            width: 300,
            child: Card(
              elevation: 20,
              child: Container(
                margin: EdgeInsets.all(20),
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                        height: 200,
                        width: 100,
                        child: SvgPicture.asset("assets/picture/Library.svg"),),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Recommended",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        Text("books",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        Text("The more you learn \nthe more you earn",style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        // chat students
        HomeItem(
          icon: Icon(Icons.send_rounded,color: Colors.blue,size: 30,),
          name: "Students",
          subtitle: "Chat with other students",
          onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatHomePage(title: "Students",)));},
        ),
        Container(
          margin: EdgeInsets.only(left: 63),
          height: .6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black.withOpacity(.2),),
          ),

        // chat teachers
        // SizedBox(
        //   height: 5,
        // ),
        HomeItem(
          icon: Icon(Icons.send_rounded,color: Colors.blue,size: 30,),
          name: "Teachers",
          subtitle: "Chat with teachers",
          onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatHomePage(title: "Teachers",)));},
        ),
        Container(
          margin: EdgeInsets.only(left: 63),
          height: .6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black.withOpacity(.2),),
        ),
        // SizedBox(
        //   height: 5,
        // ),
        // chat developper
        HomeItem(
          icon: Icon(Icons.question_mark,color: Colors.red,size: 30,),
          name: "Errors?",
          subtitle: "Send a screenshot and tell us the problem",
          onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatHomePage(title: "Programmer",isCoder: true,)));},
        ),
      ],
    );
  }
}
