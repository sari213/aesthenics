import 'package:aesthenics/pages/logIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_view_indicators/arrow_page_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tabbar/tabbar.dart';

import 'basket.dart';
import 'menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

      body:Stack(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: TabbarHeader(
              //indicatorColor: Colors.black,
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              controller: _controller,
              tabs: [

                Tab(
                  child: TextButton(onPressed: (){ Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => menu()),
                  );},child: Text(
                    "WOMAN",
                    style: TextStyle(color: Colors.black,fontSize: 20),
                  ),
                  ),
                ),
                Tab(
                  child: TextButton(onPressed: (){ Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => menu(
                    )),
                  );},child: Text(
                    "MAN",
                    style: TextStyle(color: Colors.black,fontSize: 20),
                  ),
                  ),
                ),




              ],
            ),
          ),



          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: PageView(
              controller: _controller,
              onPageChanged: (int page){
                setState(() {
                  _currentPage=page;
                });
              },
              children: [

                PageView(

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
                    /*Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 300,bottom: 100),
                        child: Row(
                          children: [
                            SmoothPageIndicator(
                              axisDirection: Axis.vertical,
                              controller: _controller,
                              count: 2,
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
                    ),*/
                  ],


                ),

                PageView(
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
                            height: 500,
                            width: 500,
                            alignment: Alignment.center,
                            child: Image.asset('assets/images/image.jpeg')),

                      ],
                    ),

                  ],
                ),
                PageView(
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
                            height: 500,
                            width: 500,
                            alignment: Alignment.center,
                            child: Image.asset('assets/images/image.jpeg')),

                      ],
                    ),

                  ],
                ),


              ],

            ),

          ),
          Row(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child:  GestureDetector(
                  onTap: () {
                    if (_currentPage < 3) {
                      setState(() {
                        _currentPage++;
                        _controller.animateToPage(
                          _currentPage,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInToLinear,
                        );
                      });
                    }else{

                    }
                  },
                  child: Icon(Icons.arrow_back_ios_rounded),

                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child:  GestureDetector(
                    onTap: () {
                      if (_currentPage < 3) {
                        setState(() {
                          _currentPage++;
                          _controller.animateToPage(
                            _currentPage,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInToLinear,
                          );
                        });
                      }else{

                      }
                    },
                    child: Icon(Icons.arrow_forward_ios_rounded),

                    ),
                  ),
                ),

            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.search,color: Colors.black,),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => logIn(
                            isbackVisible: true,
                          )),
                        );
                      },
                      icon: Icon(Icons.login,color: Colors.black,
                      ),
                    ),
                    TextButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => menu()),
                      );
                    }, child: Text('MENU',style: TextStyle(
                      color: Colors.black
                    ),)),
                    IconButton(
                      icon: Icon(Icons.account_box_rounded,color: Colors.black,),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => basket()),
                        );
                      },
                      icon: Icon(Icons.shopping_cart,color: Colors.black,),
                    ),
                  ],
                ),
              ),
            ),
          )

        ],

      )
    );
  }
}
