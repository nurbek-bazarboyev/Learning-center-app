import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hard_work_app/firebase_options.dart';
import 'package:hard_work_app/services/auth_gate.dart';
import 'package:hard_work_app/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(
      ChangeNotifierProvider(
        create: (context)=>AuthService(),
        child: const MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        hintColor: Colors.grey
      ),
      home: const AuthGate(),
    );
  }
}
