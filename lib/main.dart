import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mcapp/home.dart';
import 'package:mcapp/secondscreen.dart';




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
        home: SecondScreen(), 
        
      );
      

  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 6),
      ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>Home()))
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(child:
      Center(child: Lottie.asset('assets/animations/thewire2.json'))
      ,),
    );
  }
}