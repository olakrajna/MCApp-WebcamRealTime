import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, 
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xFF19191E),
          ),
          child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    SizedBox(height: 15),
    Padding(padding: EdgeInsets.symmetric(horizontal: 40)),
    Text(
      'READ IT \n How to use this camera:',
      textAlign: TextAlign.center,
      style: GoogleFonts.getFont(
        'Montserrat',
        textStyle: TextStyle(
          color: Colors.grey.shade300,
          fontSize: 30,
          
        ),
      ),
    ),
    SizedBox(height: 30,),
            Container(
              height: 200,
              width: 325,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(10), 
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),                    
                    Text(
                      '1. Camera settings: \nMake sure that the camera settings on your phone are properly configured for analyzing the skin. It is best to use the automatic mode or a special mode for photographing close-up objects. It is also recommended to turn off the flash mode to avoid reflections on the skin.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,                        
                        color: Color.fromRGBO(25, 25, 30, 1),
                      ),
                    ),
                  ], // <-- Added closing bracket here
                ),
              ),
              SizedBox(height: 20.0),
              Container(
              height: 140,
              width: 325,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(10), 
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),                    
                    Text(
                      '2. Lighting: \nCheck if the place where you will be using the camera is well lit. It is best to use natural light rather than artificial lighting.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,                        
                        color: Color.fromRGBO(25, 25, 30, 1),
                      ),
                    ),
                  ], // <-- Added closing bracket here
                ),
              ),
              SizedBox(height: 20.0),
              Container(
              height: 200,
              width: 325,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(10), 
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),                    
                    Text(
                      '3. Stabilization: \nMake sure the phone is stably positioned and you are holding it at an even distance from the skin.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,                        
                        color: Color.fromRGBO(25, 25, 30, 1),
                      ),
                      
                    ),
                    SizedBox(height: 20),
                GestureDetector(
                  onTap: (){
                    print("Click");
                  },
                  
                  child: Container(                    
                    alignment: Alignment.center,
                    width: 250, 
                    height: 50,
                    decoration: BoxDecoration(color: Color.fromRGBO(25, 25, 30, 1),borderRadius: BorderRadius.circular(12), 
                    boxShadow: [BoxShadow(color: Color.fromARGB(247, 0, 0, 0, ), spreadRadius: 2, blurRadius: 8,
                    offset: Offset(4,4)
                    ),
                    BoxShadow(color: Colors.white, spreadRadius: 1, blurRadius: 8,
                    offset: Offset(-4,-4)
                    ),
                    ],                    
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [                      
                    SizedBox(width: 10),
                    Text(
                    "Camera",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Icon(Icons.arrow_forward),
                      ],
                  )
                )
                )
                  ], // <-- Added closing bracket here
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}