import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hard_work_app/components/body_list_item/home.dart';
import 'package:hard_work_app/components/body_list_item/quiz.dart';
import 'package:hard_work_app/components/bottom_nav_bar.dart';
import 'package:hard_work_app/components/body_list_item/task.dart';
import 'package:hard_work_app/services/youtubeplayer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => youtubeplayer(),
      child: HomePage1(),
    );
  }
}

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  void initState() {
    super.initState();
    expansionController = ExpansionTileController();
    expansionNController = ExpansionTileController();
    expansionSController = ExpansionTileController();
  }
  ExpansionTileController? expansionController;
  ExpansionTileController? expansionNController;
  ExpansionTileController? expansionSController;
  final GlobalKey<_HomePage1State> expansionTileKey = GlobalKey();
  int currentIndex = 0;
  bool _isFullScreen = false;
  final List<Widget> _children = [Home(), YoutubeVideo(), Quiz()];
  final  info =  FirebaseFirestore.instance.collection("users").doc("${FirebaseAuth.instance.currentUser!.uid}");
  void toggleBody(int index) {
    //if(index==1){_isFullScreen = youtubeplayer().con;}
    setState(() {
      currentIndex = index;
    });
  }
  String userName(){
    String name="";
   info.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData = documentSnapshot.data()as Map<String, dynamic>;
         name = userData['name'];print(name);
      } else {
        print('Document does not exist on the database');
      }
    });
    return name;

  }
  String userEmail(){

    String email="";
    info.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData = documentSnapshot.data()as Map<String, dynamic>;
        email = userData['email'];print(email);

      } else {
        print('Document does not exist on the database');
      }
    });
    return email;

  }
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  void expand(ExpansionTileController? controller) {
    assert(controller != null);
    if (!controller!.isExpanded) {
      controller!.expand();
    }
  }

  void collapse(ExpansionTileController? controller) {
    assert(controller != null);
    if (controller!.isExpanded) {
      controller!.collapse();
    }
  }
  @override
  Widget build(BuildContext mycontext) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection("users").doc("${FirebaseAuth.instance.currentUser!.uid}").get(),
          builder: (context,snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> userData = snapshot.data!.data() as Map<String, dynamic>;
              String name = userData['name']??"";
              String surname = userData['surname']??"";
              String email = userData['email']??"";
              String phoneNumber = userData['phoneNumber']??"";

              return Container(
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    // user info
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 30,left: 30),
                      height: size.height*.3,
                      color: Colors.indigo,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // circle for picture of user
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.blueAccent,
                            child: Text("${surname!="" ? surname[0] : ""}${name!="" ? name[0] : ""}",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600),),
                          ),
                          SizedBox(height: 10,),
                          Text("${surname} ${name}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),

                          Text(email,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
                          Text(phoneNumber,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    //name
                    Material(
                      child: ExpansionTile(
                        controller: expansionController,
                        leading: Icon(CupertinoIcons.person_fill,color: Colors.grey,),
                        title: Text("Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: "${name}",
                                border: InputBorder.none
                              ),
                            ),
                          ),
                          Container(height: 1,color: Colors.grey,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(onPressed: (){collapse(expansionController);}, child: Text("cancel")),
                              TextButton(onPressed: (){
                                FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update(Map<String,dynamic>()={
                                  "name":nameController.text
                                });
                                collapse(expansionController);},
                                  child: Text("change",style: TextStyle(color: Colors.red),))
                            ],
                          )
                        ],

                      )
                    ),
                    Container(height: 1,color: Colors.grey,),
                    //surname
                    Material(
                        child: ExpansionTile(
                          controller: expansionSController,
                          leading: Icon(CupertinoIcons.person_fill,color: Colors.grey,),
                          title: Text("Surname",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: surnameController,
                                decoration: InputDecoration(
                                    hintText: "${surname}",
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            Container(height: 1,color: Colors.grey,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(onPressed: (){collapse(expansionSController);}, child: Text("cancel")),
                                TextButton(onPressed: (){
                                  FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update(Map<String,dynamic>()={
                                    "surname":surnameController.text
                                  });
                                  collapse(expansionSController);}, child: Text("change",style: TextStyle(color: Colors.red),))
                              ],
                            )
                          ],

                        )
                    ),
                    Container(height: 1,color: Colors.grey,),
                    //number
                    Material(
                        child: ExpansionTile(
                          controller: expansionNController,
                          leading: Icon(CupertinoIcons.person_fill,color: Colors.grey,),
                          title: Text("Number",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: numberController,
                                decoration: InputDecoration(
                                    hintText: "${phoneNumber}",
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            Container(height: 1,color: Colors.grey,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(onPressed: (){collapse(expansionNController);}, child: Text("cancel")),
                                TextButton(onPressed: (){
                                  FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update(Map<String,dynamic>()={
                                    "phoneNumber":numberController.text
                                  });
                                  collapse(expansionNController);}, child: Text("change",style: TextStyle(color: Colors.red),))
                              ],
                            )
                          ],

                        )
                    ),
                    Container(height: 1,color: Colors.grey,),
                    // log out
                    Material(
                      child: ListTile(
                        onTap: (){FirebaseAuth.instance.signOut();},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        leading: Icon(Icons.logout,color: Colors.grey,),
                        title: Text("Log out",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                      ),
                    ),


                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }

          }
        )
      ),
      body: Consumer<youtubeplayer>(builder: (context, change, child) {
        bool ishla = change.con;
        print(ishla);
        return OrientationBuilder(builder: (context, orientation) {
          if (orientation != Orientation.landscape) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.indigo,
                leading: IconButton(onPressed: (){Scaffold.of(context).openDrawer();}, icon: Icon(Icons.menu,color: Colors.white,)),
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
              ),
              bottomNavigationBar: buildBottomNavigationBar(
                  togglePages: toggleBody, currentIndex: currentIndex),

              body: currentIndex != 2 ? SingleChildScrollView(
                child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: (currentIndex ==2 || currentIndex ==0 ) ? 0 : 20),
                    child: _children[currentIndex]),
              ) : Padding(
                  padding:  EdgeInsets.symmetric(horizontal: (currentIndex ==2 || currentIndex ==0 ) ? 0 : 20),
                  child: _children[currentIndex]),
            );
          }
          else {
            return Scaffold(
              body: _children[currentIndex],
            );
          }
        });
      }),
    );
  }
}
