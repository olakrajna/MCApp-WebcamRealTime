import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mcapp/home.dart';
import 'package:mcapp/onboard.dart';
import 'package:mcapp/splashscreen.dart';
import 'package:tflite/tflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';

bool? seenOnboard;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCA',
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.teal),
      debugShowCheckedModeBanner: false,
      home: seenOnboard == true ? Home(): OnBoard(),
    );
  }
}

late List<CameraDescription> cameras;
late List<CameraDescription> secondCameras;

Future<void> main() async {
  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  // to load onboard for the first time only
  WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();
  // secondCameras = await availableCameras();
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? false;

  runApp(const MyApp());
}

//
// class CameraScreen extends StatefulWidget {
//   const CameraScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   late CameraController controller;
//   CameraImage? cameraImage;
//
//   CameraController? cameraController;
//   String output = '';
//
//   bool isMalignantAndDangerous() {
//     return output.startsWith('Malignant') && double.parse(output.substring(output.indexOf(' ') + 1, output.indexOf('%'))) >= 90;
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//     loadCamera();
//     loadmodel();
//   }
//
//   loadCamera() {
//     cameraController = CameraController(cameras[0], ResolutionPreset.high);
//     cameraController!.initialize().then((value) {
//       if (!mounted) {
//         return;
//       } else {
//         setState(() {
//           cameraController!.startImageStream((imageStream) {
//             cameraImage = imageStream;
//             runModel();
//           });
//         });
//       }
//     });
//   }
//
//   runModel() async {
//     if (cameraImage != null) {
//       var predictions = await Tflite.runModelOnFrame(
//           bytesList: cameraImage!.planes.map((plane) {
//             return plane.bytes;
//           }).toList(),
//           imageHeight: cameraImage!.height,
//           imageWidth: cameraImage!.width,
//           imageMean: 127.5,
//           imageStd: 127.5,
//           rotation: 90,
//           numResults: 2,
//           threshold: 0.1,
//           asynch: true);
//       predictions!.forEach((element) {
//         setState(() {
//           output = '${element['label']} ${(element['confidence'] * 100).toStringAsFixed(2)}%';
//         });
//       });
//     }
//   }
//
//   loadmodel() async {
//     await Tflite.loadModel(
//         model: "assets/ml/modelLAST22.tflite", labels: "assets/ml/label.txt");
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           Column(children: [
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: Container(
//                   color: Color.fromRGBO(179, 64, 74, 1),
//                 height: MediaQuery.of(context).size.height * 0.7,
//                 width: MediaQuery.of(context).size.width,
//                 child: !cameraController!.value.isInitialized
//                     ? Container()
//                     : AspectRatio(
//                   aspectRatio: cameraController!.value.aspectRatio,
//                   child: CameraPreview(cameraController!),
//                 ),
//               ),
//             ),
//             Text(
//               output,
//               style: GoogleFonts.getFont(
//                 'Montserrat',
//                 textStyle: TextStyle(
//                   color: Colors.grey.shade300,
//                   fontSize: 30,
//                 ),
//               ),
//             ),
//           ]),
//           if (isMalignantAndDangerous())
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.red, width: 10),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
// }
//
// class SecondCameraScreen extends StatefulWidget {
//   const SecondCameraScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SecondCameraScreen> createState() => _SecondCameraScreenState();
// }
//
// class _SecondCameraScreenState extends State<SecondCameraScreen> {
//
//   late CameraController secondCameraController;
//   CameraImage? secondCameraImage;
//
//   CameraController? cameraController;
//   String output = '';
//
//
//   @override
//   void initState() {
//     super.initState();
//     loadSecondCamera();
//     loadSecondModel();
//   }
//
//   loadSecondCamera() {
//     secondCameraController = CameraController(secondCameras[0], ResolutionPreset.high);
//     secondCameraController.initialize().then((value) {
//       if (!mounted) {
//         return;
//       } else {
//         setState(() {
//           secondCameraController.startImageStream((imageStream) {
//             secondCameraImage = imageStream;
//             runSecondModel();
//           });
//         });
//       }
//     });
//   }
//   List<Map<String, dynamic>> results = [];
//   runSecondModel() async {
//     if (secondCameraImage != null) {
//       var predictions = await Tflite.runModelOnFrame(
//         bytesList: secondCameraImage!.planes.map((plane) {
//           return plane.bytes;
//         }).toList(),
//         imageHeight: secondCameraImage!.height,
//         imageWidth: secondCameraImage!.width,
//         imageMean: 127.5,
//         imageStd: 127.5,
//         rotation: 90,
//         numResults: 2,
//         threshold: 0.1,
//         asynch: true,
//       );
//       results.clear(); // Wyczyść listę wyników przed aktualizacją
//       predictions!.forEach((element) {
//         Map<String, dynamic> result = {
//           'label': element['label'],
//           'confidence': (element['confidence'] * 100).toStringAsFixed(2),
//         };
//         results.add(result); // Dodaj wynik do listy
//       });
//
//       setState(() {
//         // Aktualizuj zmienną output
//         output = results.map((result) {
//           return '${result['label']} ${result['confidence']}%';
//         }).join('\n');
//       });
//     }
//   }
//   loadSecondModel() async {
//     await Tflite.loadModel(
//       model: "assets/ml/model9v4.tflite",
//       labels: "assets/ml/labels9.txt",
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           Column(children: [
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: Container(
//                   color: Color.fromRGBO(25, 115, 200, 1),
//                 height: MediaQuery.of(context).size.height * 0.7,
//                 width: MediaQuery.of(context).size.width,
//                 child: !secondCameraController!.value.isInitialized
//                     ? Container()
//                     : AspectRatio(
//                   aspectRatio: secondCameraController!.value.aspectRatio,
//                   child: CameraPreview(secondCameraController!),
//                 ),
//               ),
//             ),
//             Text(
//               output,
//               style: GoogleFonts.getFont(
//                 'Montserrat',
//                 textStyle: TextStyle(
//                   color: Colors.grey.shade300,
//                   fontSize: 30,
//                 ),
//               ),
//             ),
//           ])
//         ],
//       ),
//     );
//   }
//
// }

class ImagePickerDemo extends StatefulWidget {
  @override
  _ImagePickerDemoState createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  File? file;
  var _recognitions;
  var v = "";
  // var dataList = [];
  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/model9.tflite",
      labels: "assets/labels9.txt",
    );
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        file = File(image!.path);
      });
      detectimage(file!);
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future detectimage(File image) async {
    int startTime = new DateTime.now().millisecondsSinceEpoch;
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _recognitions = recognitions;
      v = recognitions.toString();
      // dataList = List<Map<String, dynamic>>.from(jsonDecode(v));
    });
    print("//////////////////////////////////////////////////");
    print(_recognitions);
    // print(dataList);
    print("//////////////////////////////////////////////////");
    int endTime = new DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_image != null)
              Image.file(
                File(_image!.path),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              )
            else
              Text('No image selected',
                style: TextStyle(
                    color: Colors.grey.shade400,
                     fontSize: 20),),
            SizedBox(height: 20),
            GestureDetector(
            onTap: _pickImage,
                child: Container(
                    alignment: Alignment.center,
                    width: 250,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(244, 178, 176, 1),
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
                          "Pick image from gallery ",
                          style: TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        Icon(Icons.linked_camera_outlined, color: Colors.white,
                            ),
                      ],
                    ))),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ImageCapture extends StatefulWidget{
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}


class _ImageCaptureState extends State<ImageCapture> {

  List<CameraDescription>? cameras; //list out the camera available
  CameraController? imageController; //controller for camera
  XFile? image; //for captured image

  @override
  void initState() {
    loadImageCamera();
    super.initState();
  }

  loadImageCamera() async {
    cameras = await availableCameras();
    if(cameras != null){
      imageController = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      imageController!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }else{
      print("NO any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center( // Wyśrodkowanie całej zawartości
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
                    height:300,
                    width:400,
                    child: imageController == null?
                    Center(child:Text("Loading Camera...")):
                    !imageController!.value.isInitialized?
                    Center(
                      child: CircularProgressIndicator(),
                    ):
                    CameraPreview(imageController!)
                ),
                SizedBox(height: 10,),
                GestureDetector(
                    onTap: () async{
                      try {
                        if(imageController != null){ //check if contrller is not null
                          if(imageController!.value.isInitialized){ //check if controller is initialized
                            image = await imageController!.takePicture(); //capture image
                            setState(() {
                              //update UI
                            });
                          }
                        }
                      } catch (e) {
                        print(e); //show error
                      }
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(244, 178, 176, 1),
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
                              "Capture ",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                            Icon(Icons.camera_outlined, color: Colors.white,
                            ),
                          ],
                        ))),
                Container( //show captured image
                  padding: EdgeInsets.all(30),
                  child: image == null?
                  Text("No image captured"):
                  Image.file(File(image!.path), height: 300,),
                  //display captured image
                )
              ]
          )
      ),

    );
  }
}