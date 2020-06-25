import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:heyloltask/videoPage.dart';

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

        // Center(
        //   child: CarouselSlider(
        //     options: CarouselOptions(
        //       scrollDirection: Axis.vertical,
        //       height: height,
        //       viewportFraction: 2.0,
        //       enableInfiniteScroll: false,
        //       enlargeCenterPage: true,
        //       // autoPlay: false,
        //     ),
        //     items: <Widget>[
        //       Scaffold(backgroundColor: Colors.black,body: Center(child: Container(color: Colors.red, height: height * 0.5, width: width,))),
        //       Scaffold(backgroundColor: Colors.black,body: Center(child: Container(color: Colors.green,height: height * 0.5, width: width,))),
        //       Scaffold(backgroundColor: Colors.black,body: Center(child: Container(color: Colors.indigo,height: height * 0.5, width: width,))),
        //       VideoPage()
        //     ],
        //     // items: imgList
        //     //     .map(
        //     //       (item) => Container(
        //     //         child: Center(
        //     //           child: Image.network(
        //     //             item,
        //     //             fit: BoxFit.cover,
        //     //             height: height,
        //     //           ),
        //     //         ),
        //     //       ),
        //     //     )
        //     //     .toList(),
        //   ),
        // );
      },
    );
  }
}
