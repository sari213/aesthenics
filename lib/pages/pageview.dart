import 'package:aesthenics/pages/about.dart';
import 'package:aesthenics/pages/basket.dart';
import 'package:aesthenics/pages/logIn.dart';
import 'package:aesthenics/pages/menu.dart';
import 'package:aesthenics/pages/menus.dart';
import 'package:aesthenics/pages/sale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tabbar/tabbar.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class pageview extends StatefulWidget {
  @override
  _pageviewState createState() => _pageviewState();
}

class _pageviewState extends State<pageview> {

  PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (int page){
              setState(() {
                _currentPage=page;
              });
            },

            //controller: pageViewController,
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 500),
                child: Container(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          child: Text('A NEW WORLD OF TRAINING',style: TextStyle(
                            fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20
                          ),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: Container(
                          child: Text('Take your training to the next level,at the gym,at',style: TextStyle(
                            color: Colors.white,fontSize: 16
                          ),),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: Text('home,at any time.',style: TextStyle(
                            color: Colors.white,fontSize: 16
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 500),
                child: Container(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          child: Text('A NEW WORLD OF TRAINING',style: TextStyle(
                              fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20
                          ),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: Container(
                          child: Text('Take your training to the next level,at the gym,at',style: TextStyle(
                              color: Colors.white,fontSize: 16
                          ),),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: Text('home,at any time.',style: TextStyle(
                              color: Colors.white,fontSize: 16
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 500),
                child: Container(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          child: Text('A NEW WORLD OF TRAINING',style: TextStyle(
                              fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20
                          ),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: Container(
                          child: Text('Take your training to the next level,at the gym,at',style: TextStyle(
                              color: Colors.white,fontSize: 16
                          ),),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: Text('home,at any time.',style: TextStyle(
                              color: Colors.white,fontSize: 16
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 500),
                child: Container(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          child: Text('A NEW WORLD OF TRAINING',style: TextStyle(
                              fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20
                          ),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: Container(
                          child: Text('Take your training to the next level,at the gym,at',style: TextStyle(
                              color: Colors.white,fontSize: 16
                          ),),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: Text('home,at any time.',style: TextStyle(
                              color: Colors.white,fontSize: 16
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 500),
                child: Container(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          child: Text('A NEW WORLD OF TRAINING',style: TextStyle(
                              fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20
                          ),),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: Container(
                          child: Text('Take your training to the next level,at the gym,at',style: TextStyle(
                              color: Colors.white,fontSize: 16
                          ),),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: Text('home,at any time.',style: TextStyle(
                              color: Colors.white,fontSize: 16
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


            ],




          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    axisDirection: Axis.horizontal,
                    controller: _controller,
                    count: 5,
                    effect: SlideEffect(
                        spacing:  10,
                        radius:  5,
                        dotWidth: 8,
                        dotHeight: 8,
                        dotColor: Colors.white,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth:  1,
                        activeDotColor: Colors.white),
                  ),
                ],
              ),
            ),
          ),


        ],

      ),

    );
  }

}
