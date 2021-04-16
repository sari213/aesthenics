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

class Fhome extends StatefulWidget {
  @override
  _FhomeState createState() => _FhomeState();
}

class _FhomeState extends State<Fhome> {

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //leading: IconButton(icon: Icon(Icons.close),color: Colors.black,onPressed: ()=> Navigator.pop(context),),        centerTitle: true,
        bottom: PreferredSize(
         // preferredSize: Size.fromHeight(kToolbarHeight),
          child: TabbarHeader(
            indicatorColor: Colors.black,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            controller: controller,
            tabs: [

              Tab(
                child: Text(
                  "MAN",
                  style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "WOMAN",
                  style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                ),
              ),

            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          TabbarContent(
            controller: controller,
            children: <Widget>[
              PageView(
                controller: _controller,
                onPageChanged: (int page){
                  setState(() {
                    _currentPage=page;
                  });
                },

                //controller: pageViewController,
                scrollDirection: Axis.vertical,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 500,

                          child: Image.asset('assets/images/man.jpg',fit: BoxFit.cover,)),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(100.0),
                          child: RaisedButton(

                            child: Text('view'),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => menus()),
                              );
                            },
                          ),
                        ),
                      )

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                     // color: Colors.grey,
                    // alignment: Alignment.center,
                        child: GestureDetector(
                          onTap:(){  Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => sale()),
                          );},
                          child: Image.asset('assets/images/diwali.png',
                              width: 800,

                              fit:BoxFit.fill ),
                        )
                    ),
                  ),

                  Container(

                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20,),
                            Text('#NEW ARRIVALS',style: TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 20,),


                            Row(
                              children: <Widget>[
                                Expanded(
                                  child:  Container(

                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ), //BoxD// ecoration
                                    child: Column(
                                      children: [
                                        Image.asset('assets/images/t-shirt-sport.jpg',
                                            height: 200,
                                            fit:BoxFit.cover ),
                                        Text('T-Shirt'),
                                        Text('499')


                                      ],
                                    ),
                                  ),
                                ), //Conatiner
                                SizedBox(
                                  width: 10,
                                ), //SizedBox
                                Expanded(
                                  child: Container(

                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ), //BoxD// ecoration
                                    child: Column(
                                      children: [
                                        Image.asset('assets/images/t-shirt-sport.jpg',
                                            height: 200,
                                            fit:BoxFit.cover ),
                                        Text('T-Shirt'),
                                        Text('499')


                                      ],
                                    ),
                                  ),
                                ),  //Container
                              ], //<Widget>[]
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child:  Container(

                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ), //BoxD// ecoration
                                    child: Column(
                                      children: [
                                        Image.asset('assets/images/t-shirt-sport.jpg',
                                            height: 200,
                                            fit:BoxFit.cover ),
                                        Text('T-Shirt'),
                                        Text('499')


                                      ],
                                    ),
                                  ),
                                ), //Conatiner
                                SizedBox(
                                  width: 10,
                                ), //SizedBox
                                Expanded(
                                  child: Container(

                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ), //BoxD// ecoration
                                    child: Column(
                                      children: [
                                        Image.asset('assets/images/t-shirt-sport.jpg',
                                            height: 200,
                                            fit:BoxFit.cover ),
                                        Text('T-Shirt'),
                                        Text('499')


                                      ],
                                    ),
                                  ),
                                ),  //Container
                              ], //<Widget>[]
                              mainAxisAlignment: MainAxisAlignment.center,
                            ), //Row
                          ], //<widget>[]

                        ), //Column
                      ) //Padding
                  ), //C



                  Container(
                    child: SingleChildScrollView(

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          TextButton(
                            child: Text('QUICK LINKS',style: TextStyle(
                                color: Colors.black
                            ),),
                          ),
                          TextButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => about()),
                            );
                          }, child: Text('ABOUT AESTHENIC',style: TextStyle(
                              color: Colors.black45
                          ),)),
                          Divider(
                            height:1,
                            color: Colors.black45,
                          ),
                          TextButton(onPressed: null, child: Text('BECOME AN AMBASSADOR',style: TextStyle(
                              color: Colors.black45
                          ),)),
                          Divider(
                            height: 1,
                            color: Colors.black45,
                          ),

                          TextButton(onPressed: null, child: Text('QUALITY',style: TextStyle(
                              color: Colors.black45,
                          ),)
                          ),
                          Divider(
                            height: 1,
                            color: Colors.black45,
                          ),
                         
                          TextButton(onPressed: null, child: Text(' LETS GET SOCIAL',style: TextStyle(
                              color: Colors.black
                          ),)),
                          Container(
                            height: 30,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: SignInButton(
                                    Buttons.LinkedIn,
                                    mini: true,
                                    onPressed: () {
                                      //_showButtonPressDialog(context, 'LinkedIn (mini)');
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: SignInButton(
                                    Buttons.Tumblr,
                                    mini: true,
                                    onPressed: () {
                                     // _showButtonPressDialog(context, 'Tumblr (mini)');
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: SignInButton(
                                    Buttons.Facebook,
                                    mini: true,
                                    onPressed: () {
                                      //_showButtonPressDialog(context, 'Facebook (mini)');
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: SignInButtonBuilder(
                                    icon: Icons.email,
                                    text: "Ignored for mini button",
                                    mini: true,
                                    onPressed: () {
                                    // _showButtonPressDialog(context, 'Email (mini)');
                                    },
                                    backgroundColor: Colors.cyan,
                                  ),
                                ),

                              ],
                            ),
                          ),
                          TextButton(
                            child: Text('CUSTOMER SERVICE',style: TextStyle(
                                color: Colors.black
                            ),),
                          ),

                          TextButton(onPressed: null, child: Text('TRACK ORDER',style: TextStyle(
                              color: Colors.black45
                          ),)),
                          Divider(
                            height: 1,
                            color: Colors.black45,
                          ),
                          TextButton(onPressed: null, child: Text('SIZE GUID - MEN',style: TextStyle(
                              color: Colors.black45
                          ),)),
                          Divider(
                            height: 1,
                            color: Colors.black45,
                          ),
                          TextButton(onPressed: null, child: Text('SIZE GUID - WOMEN',style: TextStyle(
                              color: Colors.black45
                          ),)), Divider(
                            height: 1,
                            color: Colors.black45,
                          ),
                          TextButton(onPressed: null, child: Text('SHIPPING AND DILIVERY',style: TextStyle(
                              color: Colors.black45
                          ),)), Divider(
                            height: 1,
                            color: Colors.black45,
                          ),
                          TextButton(onPressed: null, child: Text('RETURN AND EXCHANGE',style: TextStyle(
                              color: Colors.black45
                          ),)), Divider(
                            height: 1,
                            color: Colors.black45,
                          ),
                          TextButton(onPressed: null, child: Text('CONTACT US',style: TextStyle(
                              color: Colors.black45
                          ),)),


                        ],
                      ),
                    ),
                  ),


                ],




              ),
              //woman tab
              PageView(
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

                          child: Image.asset('assets/images/woman.png',fit: BoxFit.cover,)),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: RaisedButton(

                          child: Text('view'),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => menu()),);},
                        ),
                      )

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      // color: Colors.grey,
                      // alignment: Alignment.center,
                        child: GestureDetector(
                          onTap:(){  Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => sale()),
                          );},
                          child: Image.asset('assets/images/diwali.png',
                              width: 800,

                              fit:BoxFit.fill ),
                        )
                    ),
                  ),
                  Container(

                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20,),
                            Text('#NEW ARRIVALS',style: TextStyle(
                                fontSize: 20,fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 20,),


                            Row(
                              children: <Widget>[
                                Expanded(
                                  child:  Container(

                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ), //BoxD// ecoration
                                    child: Column(
                                      children: [
                                        Image.asset('assets/images/t-shirt-sport.jpg',
                                            height: 200,
                                            fit:BoxFit.cover ),
                                        Text('T-Shirt'),
                                        Text('499')


                                      ],
                                    ),
                                  ),
                                ), //Conatiner
                                SizedBox(
                                  width: 10,
                                ), //SizedBox
                                Expanded(
                                  child: Container(

                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ), //BoxD// ecoration
                                    child: Column(
                                      children: [
                                        Image.asset('assets/images/t-shirt-sport.jpg',
                                            height: 200,
                                            fit:BoxFit.cover ),
                                        Text('T-Shirt'),
                                        Text('499')


                                      ],
                                    ),
                                  ),
                                ),  //Container
                              ], //<Widget>[]
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child:  Container(

                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ), //BoxD// ecoration
                                    child: Column(
                                      children: [
                                        Image.asset('assets/images/t-shirt-sport.jpg',
                                            height: 200,
                                            fit:BoxFit.cover ),
                                        Text('T-Shirt'),
                                        Text('499')


                                      ],
                                    ),
                                  ),
                                ), //Conatiner
                                SizedBox(
                                  width: 10,
                                ), //SizedBox
                                Expanded(
                                  child: Container(

                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ), //BoxD// ecoration
                                    child: Column(
                                      children: [
                                        Image.asset('assets/images/t-shirt-sport.jpg',
                                            height: 200,
                                            fit:BoxFit.cover ),
                                        Text('T-Shirt'),
                                        Text('499')


                                      ],
                                    ),
                                  ),
                                ),  //Container
                              ], //<Widget>[]
                              mainAxisAlignment: MainAxisAlignment.center,
                            ), //Row
                          ], //<widget>[]

                        ), //Column
                      ) //Padding
                  ),
                  //C
                  Container(
                    child: SingleChildScrollView(

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          TextButton(
                            child: Text('QUICK LINKS',style: TextStyle(
                                color: Colors.black
                            ),),
                          ),
                          TextButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => about()),
                            );
                          }, child: Text('ABOUT AESTHENIC',style: TextStyle(
                              color: Colors.black45
                          ),)),
                          Divider(
                            height:1,
                            color: Colors.black45,
                          ),
                          TextButton(onPressed: null, child: Text('BECOME AN AMBASSADOR',style: TextStyle(
                              color: Colors.black45
                          ),)),
                          Divider(
                            height: 1,
                            color: Colors.black45,
                          ),

                          TextButton(onPressed: null, child: Text('QUALITY',style: TextStyle(
                            color: Colors.black45,
                          ),)
                          ),
                          Divider(
                            height: 1,
                            color: Colors.black45,
                          ),

                          TextButton(onPressed: null, child: Text(' LETS GET SOCIAL',style: TextStyle(
                              color: Colors.black
                          ),)),
                          Container(
                            height: 30,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: SignInButton(
                                    Buttons.LinkedIn,
                                    mini: true,
                                    onPressed: () {
                                      //_showButtonPressDialog(context, 'LinkedIn (mini)');
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: SignInButton(
                                    Buttons.Tumblr,
                                    mini: true,
                                    onPressed: () {
                                      // _showButtonPressDialog(context, 'Tumblr (mini)');
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: SignInButton(
                                    Buttons.Facebook,
                                    mini: true,
                                    onPressed: () {
                                      //_showButtonPressDialog(context, 'Facebook (mini)');
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: SignInButtonBuilder(
                                    icon: Icons.email,
                                    text: "Ignored for mini button",
                                    mini: true,
                                    onPressed: () {
                                      // _showButtonPressDialog(context, 'Email (mini)');
                                    },
                                    backgroundColor: Colors.cyan,
                                  ),
                                ),

                              ],
                            ),
                          ),
                          TextButton(
                            child: Text('CUSTOMER SERVICE',style: TextStyle(
                                color: Colors.black
                            ),),
                          ),

                          TextButton(onPressed: null, child: Text('TRACK ORDER',style: TextStyle(
                              color: Colors.black45
                          ),)),
                          Divider(
                            height: 1,
                            color: Colors.black45,
                          ),
                          TextButton(onPressed: null, child: Text('SIZE GUID - MEN',style: TextStyle(
                              color: Colors.black45
                          ),)),
                          Divider(
                            height: 1,
                            color: Colors.black45,
                          ),
                          TextButton(onPressed: null, child: Text('SIZE GUID - WOMEN',style: TextStyle(
                              color: Colors.black45
                          ),)), Divider(
                            height: 1,
                            color: Colors.black45,
                          ),
                          TextButton(onPressed: null, child: Text('SHIPPING AND DILIVERY',style: TextStyle(
                              color: Colors.black45
                          ),)), Divider(
                            height: 1,
                            color: Colors.black45,
                          ),
                          TextButton(onPressed: null, child: Text('RETURN AND EXCHANGE',style: TextStyle(
                              color: Colors.black45
                          ),)), Divider(
                            height: 1,
                            color: Colors.black45,
                          ),
                          TextButton(onPressed: null, child: Text('CONTACT US',style: TextStyle(
                              color: Colors.black45
                          ),)),


                        ],
                      ),
                    ),
                  ),


                ],




              ),

            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 350),
              child: Row(
                children: [
                  SmoothPageIndicator(
                    axisDirection: Axis.vertical,
                    controller: _controller,
                    count: 4,
                    effect: SlideEffect(
                        spacing:  5,
                        radius:  5,
                        dotWidth: 5,
                        dotHeight: 5,
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

      ),

    );
  }

}
/*
Container(
height: 700,
child: GridView.builder(
gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
maxCrossAxisExtent: 200,
childAspectRatio: 2 / 3,

crossAxisSpacing: 20,
mainAxisSpacing: 20),
itemCount: 4,

itemBuilder: (BuildContext ctx, index) {
return Container(
alignment: Alignment.bottomLeft,
child: Stack(
children: [
Image.asset('assets/images/t-shirt-sport.jpg',
height: 220,
fit:BoxFit.fill ),
Align(
alignment: Alignment.bottomLeft,
child: Padding(
padding: const EdgeInsets.only(left: 8,bottom: 25),
child: Text('T-Shirt-Blue',style: TextStyle(
color: Colors.black45
),),
)),
SizedBox(height: 10,),
Align(
alignment: Alignment.bottomLeft,
child: Padding(
padding: const EdgeInsets.only(left: 8,bottom: 8),
child: Text('Rs-499',style: TextStyle(
fontWeight: FontWeight.bold
),),
)),

Padding(
padding: const EdgeInsets.only(left: 110),
child: Align(
alignment: Alignment.topRight,
child: FlatButton(
onPressed: () {},
child: Icon(Icons.favorite,color: Colors.black45),
shape: CircleBorder(
side: BorderSide(
color: Colors.black45,
),
),
),
),
)


],
),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(15)),
);
}),
),*/
