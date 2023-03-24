import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  late File _image;
  final imagepicker = ImagePicker();

  _loading_gallery() async {
    var image = await imagepicker.getImage(source: ImageSource.gallery);
    if(image==null) {
      return null;
    }
    else{
      setState(() {
        _loading = false;
      });
      _image = File(image.path);
    }
  }

  _loading_camera() async {
    var image = await imagepicker.getImage(source: ImageSource.camera);
    if(image==null) {
      return null;
    }
    else{
       setState(() {
        _loading = false;
      });
      _image = File(image.path);
      print('Selected image from gallery: $_image');
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Melanoma Classification App'),
        backgroundColor: Colors.indigoAccent[100],
      ),
      body: Container(
        height: h,
        width: w,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/images/MCA.png'),
            ),
            Container(
              child: Text(
                'MELANOMA CLASSIFICATION APP',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  _loading_camera();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.indigoAccent[100],
                ),
                child: const Text('Camera'),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  _loading_gallery();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.indigoAccent[100],
                ),
                child: const Text('Gallery'),
              ),
            ),
            _loading == false
                ? Container(
                    height: 200,
                    width: 200,
                    child: Image.file(_image),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}