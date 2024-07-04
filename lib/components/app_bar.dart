import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.indigo,
    leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.white,)),
    title: const Center(child: Text("HardWork ELC",style: TextStyle(color: Colors.white),)),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blueAccent,
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                      "assets/picture/img.png",
                    ),
                    fit: BoxFit.fill)),
            //child: Image.asset("assets/picture/img.png",fit: BoxFit.fill,),
          ),
        ),
      )
    ],
  );
}