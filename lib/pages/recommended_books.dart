import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hard_work_app/pages/chat_pages/chat_page.dart';

class RecommendedBooks extends StatelessWidget {
   RecommendedBooks({super.key});

   QuerySnapshot<Map<String, dynamic>>? book;

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
        return SizedBox(
          height: size.height,
          width: size.width,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.indigo,
              leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(CupertinoIcons.back,color: Colors.white,)),
              title: Text("Books",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance.collection("kitob").get(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                book = snapshot.data;
                return ListView.builder(
                    itemCount: book!.docs.length,
                    itemBuilder: (context,index){
                      final bookData = book!.docs[index].data();
                      String? Buy="I wanna buy this book \nname: ${bookData['name']}\nprice: ${bookData['price']}";
                      return SizedBox(
                        height: 300,
                        width: size.width,
                        child: Card(
                          margin: EdgeInsets.all(20),
                          color: Colors.white,
                          shadowColor: Colors.black,
                          elevation: 20,
                          child: Row(children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20,left: 10),
                                  height: 180,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(image: NetworkImage(bookData['image']),
                                          fit: BoxFit.fill)
                                  ),
                                ),
                                Text("${bookData['price']} so'm",style: TextStyle(fontWeight: FontWeight.bold),)
                              ],),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: SizedBox(
                                width: 170,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20,),
                                    Text("\"${bookData['name']}\"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),maxLines: 3,),
                                    Text("\"${bookData['info']}\"",style: TextStyle(fontSize: 12),maxLines: 5,),
                                    Text("\"${bookData['type']}\"",style: TextStyle(fontSize: 12),maxLines: 3,),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: GestureDetector(
                                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(receiverUserEmail: "reception@gmail.com", receiverUserID: "qZhuDZCN6feV3sahUzEPNah9KBv1",buy: Buy,)));},
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(10),
                                          ),child: Text("Book",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 55,),

                                  ],
                                ),
                              ),
                            )
                          ],),
                        ),
                      );}
                  //         Container(
                  //       margin: EdgeInsets.all(20),
                  //   height: 300,
                  //   width: size.width,
                  //   color: Colors.red,
                  // )
                );
              }else{
                return Center(child: CircularProgressIndicator.adaptive(),);
              }

            })
          ),
        );
  }
}
