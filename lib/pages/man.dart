import 'package:aesthenics/pages/logIn.dart';
import 'package:aesthenics/pages/profile.dart';
import 'package:aesthenics/pages/search.dart';
import 'package:aesthenics/pages/women.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_view_indicators/arrow_page_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tabbar/tabbar.dart';

import 'basket.dart';
import 'menu.dart';

class man extends StatefulWidget {
  @override
  _manState createState() => _manState();
}

class _manState extends State<man> {
  PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:  IconButton(icon: Icon(Icons.close),color: Colors.black,iconSize: 30,
          onPressed: ()=> Navigator.pop(context),),
      ),

        body:Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: PageView(
                controller: _controller,
                onPageChanged: (int page){
                  setState(() {
                    _currentPage=page;
                  });
                },

                //controller: pageViewController,
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    children: [
                      Container(
                          height: 500,
                          width: 500,
                          alignment: Alignment.center,
                          child: Image.asset('assets/images/image.jpeg')),

                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          height: 400,
                          width: 250,
                          alignment: Alignment.center,
                          child: Image.asset('assets/images/image.jpeg')),

                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          height: 400,
                          width: 250,
                          alignment: Alignment.center,
                          child: Image.asset('assets/images/image.jpeg')),

                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          height: 400,
                          width: 250,
                          alignment: Alignment.center,
                          child: Image.asset('assets/images/image.jpeg')),

                    ],
                  ),

                ],


              ),

            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 300,bottom: 150),
                child: Row(
                  children: [
                    SmoothPageIndicator(
                      axisDirection: Axis.vertical,
                      controller: _controller,
                      count: 4,
                      effect: SlideEffect(
                          spacing:  5,
                          radius:  12,
                          dotWidth: 12,
                          dotHeight:  12,
                          dotColor: Colors.black,
                          paintStyle: PaintingStyle.stroke,
                          strokeWidth:  1,
                          activeDotColor: Colors.black),
                    ),
                  ],
                ),
              ),
            ),




          ],

        )
    );
  }
}
