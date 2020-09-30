import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: HomePage(),
        ),
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;
  Future CameraImage()async{
    // ignore: deprecated_member_use
    var image=await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image=image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          color: Colors.blue,
          child: _image==null?Center(child: Text("Image not load")):Image.file(_image),
        ),
        Divider(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(onPressed: (){
              CameraImage();
            },child: Icon(Icons.camera),),
            SizedBox(width: 10,),
            FloatingActionButton(onPressed: (){
            },child: Icon(Icons.photo_library),),
          ],
        )
      ],
    );
  }
}

