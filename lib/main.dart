import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
      home: seenOnboard == true ? SplashScreen() : OnBoard(),
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
  cameras = await availableCameras();
  secondCameras = await availableCameras();
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? false;

  runApp(const MyApp());
}


class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  CameraImage? cameraImage;

  CameraController? cameraController;
  String output = '';

  bool isMalignantAndDangerous() {
    return output.startsWith('Malignant') && double.parse(output.substring(output.indexOf(' ') + 1, output.indexOf('%'))) >= 90;
  }


  @override
  void initState() {
    super.initState();
    loadCamera();
    loadmodel();
  }

  loadCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }

  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true);
      predictions!.forEach((element) {
        setState(() {
          output = '${element['label']} ${(element['confidence'] * 100).toStringAsFixed(2)}%';
        });
      });
    }
  }

  loadmodel() async {
    await Tflite.loadModel(
        model: "assets/ml/modelLAST22.tflite", labels: "assets/ml/label.txt");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: !cameraController!.value.isInitialized
                    ? Container()
                    : AspectRatio(
                  aspectRatio: cameraController!.value.aspectRatio,
                  child: CameraPreview(cameraController!),
                ),
              ),
            ),
            Text(
              output,
              style: GoogleFonts.getFont(
                'Montserrat',
                textStyle: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 30,
                ),
              ),
            ),
          ]),
          if (isMalignantAndDangerous())
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 10),
                ),
              ),
            ),
        ],
      ),
    );
  }

}

class SecondCameraScreen extends StatefulWidget {
  const SecondCameraScreen({Key? key}) : super(key: key);

  @override
  State<SecondCameraScreen> createState() => _SecondCameraScreenState();
}

class _SecondCameraScreenState extends State<SecondCameraScreen> {

  late CameraController secondCameraController;
  CameraImage? secondCameraImage;

  CameraController? cameraController;
  String output = '';


  @override
  void initState() {
    super.initState();
    loadSecondCamera();
    loadSecondModel();
  }

  loadSecondCamera() {
    secondCameraController = CameraController(secondCameras[0], ResolutionPreset.high);
    secondCameraController.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          secondCameraController.startImageStream((imageStream) {
            secondCameraImage = imageStream;
            runSecondModel();
          });
        });
      }
    });
  }
  List<Map<String, dynamic>> results = [];
  runSecondModel() async {
    if (secondCameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
        bytesList: secondCameraImage!.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: secondCameraImage!.height,
        imageWidth: secondCameraImage!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 2,
        threshold: 0.1,
        asynch: true,
      );
      results.clear(); // Wyczyść listę wyników przed aktualizacją
      predictions!.forEach((element) {
        Map<String, dynamic> result = {
          'label': element['label'],
          'confidence': (element['confidence'] * 100).toStringAsFixed(2),
        };
        results.add(result); // Dodaj wynik do listy
      });

      setState(() {
        // Aktualizuj zmienną output
        output = results.map((result) {
          return '${result['label']} ${result['confidence']}%';
        }).join('\n');
      });
    }
  }
  loadSecondModel() async {
    await Tflite.loadModel(
      model: "assets/ml/model9.tflite",
      labels: "assets/ml/labels9.txt",
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: !secondCameraController!.value.isInitialized
                    ? Container()
                    : AspectRatio(
                  aspectRatio: secondCameraController!.value.aspectRatio,
                  child: CameraPreview(secondCameraController!),
                ),
              ),
            ),
            Text(
              output,
              style: GoogleFonts.getFont(
                'Montserrat',
                textStyle: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 30,
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }

}
