import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fudddel/presentation/screens/startscreen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //firebase initialization
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const Startscreen(),
    );
  }
}
