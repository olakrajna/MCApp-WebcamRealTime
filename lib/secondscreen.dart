import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mcapp/main.dart';
import 'package:page_transition/page_transition.dart';


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
            color: Colors.white,
          ),
          child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    SizedBox(height: 15),
    Padding(padding: EdgeInsets.symmetric(horizontal: 40)),
    Text(
      'SELECT CAMERA',
      textAlign: TextAlign.center,
      style: GoogleFonts.getFont(
        'Montserrat',
        textStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 25,
          
        ),
      ),
    ),
    SizedBox(height: 20,),
            // Container(
            //   height: MediaQuery.of(context).size.height/3,
            //   width: 325,
            //   padding: const EdgeInsets.all(15),
            //   decoration: BoxDecoration(color: Color.fromRGBO(244, 178, 176, 1),
            //       borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Text(
            //           'MELANOMA CLASSIFICATION CAMERA',
            //           textAlign: TextAlign.center,
            //           style: GoogleFonts.getFont(
            //             'Montserrat',
            //             textStyle: TextStyle(
            //               color: Colors.white,
            //               fontSize: 20,
            //                 fontWeight: FontWeight.bold
            //
            //             ),
            //           ),
            //         ),
            //         SizedBox(height: 10,),
            //         Text(
            //           'This apparatus enables accurate classification of melanoma skin cancer, distinguishing between malignant and benign forms of the disease.',
            //           textAlign: TextAlign.center,
            //           style: GoogleFonts.getFont(
            //             'Montserrat',
            //             fontSize: 16,
            //             color: Colors.white,
            //           ),
            //         ),
            //         SizedBox(height: 40,),
            //         GestureDetector(
            //             onTap: () {
            //               Navigator.push(
            //                 context,
            //                 PageTransition(
            //                   type: PageTransitionType.leftToRight,
            //                   child: CameraScreen(),
            //                 ),
            //               );
            //               print("Click");
            //             },
            //             child: Container(
            //                 alignment: Alignment.center,
            //                 width: 200,
            //                 height: 40,
            //                 decoration: BoxDecoration(
            //                     color: Colors.white,
            //                   borderRadius: BorderRadius.circular(12),
            //                   boxShadow: [
            //                     BoxShadow(
            //                         color: Color.fromARGB(
            //                           247,
            //                           0,
            //                           0,
            //                           0,
            //                         ),
            //                         spreadRadius: 2,
            //                         blurRadius: 8,
            //                         offset: Offset(4, 4)),
            //                     BoxShadow(
            //                         color: Colors.white,
            //                         spreadRadius: 1,
            //                         blurRadius: 8,
            //                         offset: Offset(-4, -4)),
            //                   ],
            //                 ),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     SizedBox(width: 10),
            //                     Text(
            //                       "Camera",
            //                       style: TextStyle(
            //                           color: Color.fromRGBO(179, 64, 74, 1), fontSize: 18),
            //                     ),
            //                     Icon(Icons.arrow_forward, color: Color.fromRGBO(179, 64, 74, 1),),
            //                   ],
            //                 ))),
            //       ],
            //     // <-- Added closing bracket here
            //     ),
            //   ),

              SizedBox(height: 10.0),
              Container(
              height: MediaQuery.of(context).size.height/1.5,
              width: 325,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Color.fromRGBO(244, 178, 176, 1), borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'SKIN CANCER CLASSIFICATION CAMERA',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,

                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "This camera allows for the classification of the following conditions: actinic keratosis, basal cell carcinoma, squamous cell carcinoma, melanoma, pigmented benign keratosis, seborrheic keratosis, dermatofibroma, and vascular lesions.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10,),
                    // GestureDetector(
                    //     onTap: () {
                    //       Navigator.push(
                    //         context,
                    //         PageTransition(
                    //           type: PageTransitionType.leftToRight,
                    //           child: CameraScreen(),
                    //         ),
                    //       );
                    //       print("Click");
                    //     },
                    //     child: Container(
                    //         alignment: Alignment.center,
                    //         width: 200,
                    //         height: 40,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(12),
                    //           boxShadow: [
                    //             BoxShadow(
                    //                 color: Color.fromARGB(
                    //                   247,
                    //                   0,
                    //                   0,
                    //                   0,
                    //                 ),
                    //                 spreadRadius: 2,
                    //                 blurRadius: 8,
                    //                 offset: Offset(4, 4)),
                    //             BoxShadow(
                    //                 color: Colors.white,
                    //                 spreadRadius: 1,
                    //                 blurRadius: 8,
                    //                 offset: Offset(-4, -4)),
                    //           ],
                    //         ),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             SizedBox(width: 10),
                    //             Text(
                    //               "Camera ",
                    //               style: TextStyle(
                    //                   color: Color.fromRGBO(179, 64, 74, 1), fontSize: 18),
                    //             ),
                    //             Icon(Icons.camera_outlined, color: Color.fromRGBO(179, 64, 74, 1),),
                    //           ],
                    //         ))),
                    SizedBox(height: 20,),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: ImageCapture(),
                            ),
                          );
                          print("Click");
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                                  "Take a photo ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(179,  64, 74, 1), fontSize: 18),
                                ),
                                Icon(Icons.linked_camera_outlined, color: Color.fromRGBO(179, 64, 74, 1),),
                              ],
                            ))),
                    SizedBox(height: 20,),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: ImagePickerDemo(),
                            ),
                          );
                          print("Click");
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                                  "Pick image ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(179, 64, 74, 1), fontSize: 18),
                                ),
                                Icon(Icons.photo_library_outlined, color: Color.fromRGBO(179, 64, 74, 1),),
                              ],
                            ))),
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