import 'package:flutter/material.dart';
import 'package:mcapp/home.dart';




void main() =>  runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.teal),
        debugShowCheckedModeBanner: false,
        home: Home(),
      );
      

  }
}

