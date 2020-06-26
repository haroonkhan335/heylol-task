import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:heyloltask/Authentication/auth_screen.dart';
import 'package:heyloltask/FirebaseDatabase/firebase_functions.dart';
import 'package:heyloltask/Home/videoPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FullscreenSliderDemo();
  }
}

class FullscreenSliderDemo extends StatelessWidget {

  FirebaseStorage storageRef = FirebaseStorage(storageBucket: "gs://heylol-task.appspot.com/heylol-task");

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final double height = MediaQuery.of(context).size.height;
        final double width = MediaQuery.of(context).size.width;
        return PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                    child: Container(
                  color: Colors.red,
                  height: height * 0.5,
                  width: width,
                  child: GestureDetector(
                    onTap: () {
                      logout();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AuthScreen()));
                    },
                  ),
                ))),
            Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                    child: Container(
                  color: Colors.green,
                  height: height * 0.5,
                  width: width,
                ))),
            Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                    child: Container(
                  color: Colors.indigo,
                  height: height * 0.5,
                  width: width,
                ))),
            VideoPage()
          ],
        );
      },
    );
  }
}
