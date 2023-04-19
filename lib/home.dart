import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mcapp/secondscreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  late File _image;
  final imagepicker = ImagePicker();

  _loading_gallery() async {
    var image = await imagepicker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      setState(() {
        _loading = false;
      });
      _image = File(image.path);
    }
  }

  _loading_camera() async {
    var image = await imagepicker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      setState(() {
        _loading = false;
      });
      _image = File(image.path);
      print('Selected image from gallery: $_image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.6,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.6,
              decoration: BoxDecoration(
                color: Color(0xFF19191E),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('/images/logo12.png', height: 300),
                  SizedBox(height: 15),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 40)),
                  Text(
                    'MELANOMA \n CLASSIFICATION ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      textStyle: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.666,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(25, 25, 30, 1),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.666,
                  padding: EdgeInsets.only(top: 40, bottom: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(70))),
                  child: Column(
                    children: [
                      Text(
                        "Skin examinations",
                        style: GoogleFonts.getFont('Montserrat',
                            textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                wordSpacing: 2,
                                color: Color.fromRGBO(25, 25, 30, 1))),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "A mobile tool to assist the dermatologist in classifying skin lesions.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont('Montserrat',
                              textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black.withOpacity(0.6),
                              )),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                          onTap: () {    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
                            print("Click");
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 250,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(25, 25, 30, 1),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(
                                        247,
                                        0,
                                        0,
                                        0,
                                      ),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                      offset: Offset(4, 4)),
                                  BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 1,
                                      blurRadius: 8,
                                      offset: Offset(-4, -4)),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 10),
                                  Text(
                                    "Get started",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  Icon(Icons.arrow_forward),
                                ],
                              )))
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
