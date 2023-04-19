import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mcapp/main.dart';


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
          fontSize: 25,
          
        ),
      ),
    ),
    SizedBox(height: 20,),
            Container(
              height: 140,
              width: 325,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(10), 
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '1. Camera settings: \nMake sure that the camera settings on your phone are properly configured for analyzing the skin. It is best to use the automatic mode or a special mode for photographing close-up objects. It is also recommended to turn off the flash mode to avoid reflections on the skin.',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontSize: 12,                        
                        color: Color.fromRGBO(25, 25, 30, 1),
                      ),
                    ),
                  ], // <-- Added closing bracket here
                ),
              ),
              SizedBox(height: 10.0),
              Container(
              height: 140,
              width: 325,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(10), 
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [                                        
                    Text(
                      "2. Lighting: \nPrepare the patient for the photo by placing them in a well-lit room and preparing the area where the photo will be taken. Pay attention to ensuring that the patient's skin is well-lit, and any clothing or accessories are removed to ensure the best quality photo.",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontSize: 12,                        
                        color: Color.fromRGBO(25, 25, 30, 1),
                      ),
                    ),
                  ], // <-- Added closing bracket here
                ),
              ),
            SizedBox(height: 10,),
            Container(
              height: 120,
              width: 325,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(10), 
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '3. Stabilization: \nPay particular attention to the position of the patient. The patient should be positioned straight, and the skin should be clearly visible in the photo. We recommend using a tripod or similar device to ensure stability when identifying a skin lesion.',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontSize: 12,                        
                        color: Color.fromRGBO(25, 25, 30, 1),
                      ),
                    ),
                  ], // <-- Added closing bracket here
                ),
              ),
              SizedBox(height: 10.0),
              Container(
              height: 160,
              width: 325,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(10), 
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '4. Make sure you are close enough to get a detailed image, but at the same time not too close to avoid distortion. Hover over the change and wait for the result.',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontSize: 12,                        
                        color: Color.fromRGBO(25, 25, 30, 1),
                      ),
                      
                    ),
                    SizedBox(height: 10),
                GestureDetector(
                  onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen()));
                    print("Click");
                  },
                  
                  child: Container(                    
                    alignment: Alignment.center,
                    width: 200, 
                    height: 40,
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