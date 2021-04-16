import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'introPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _getToken();
  }

  _getToken() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    bool isLogin =
//        prefs.getString(Constants.accessTokenStr) == null ? false : true;
//    String isVerify =
//    prefs.getString(Constants.emailVerifyStr) == null ? "0" : "1";
//    final provider=Provider.of<NameFlag>(context,listen: false);
//    provider.setName(prefs.getString(Constants.firstNameStr), prefs.getString(Constants.lastNameStr));
//    provider.setEmail(prefs.getString(Constants.emailStr));

    Timer(Duration(seconds: 3), () {
      _goToMain(false,"1");
    });
  }

  _goToMain(bool isLogin,String isVerify) {
    /*if (isLogin) {

      if(isVerify=="1"){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => VerifyPage()),
        );
      }

    } else {*/
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => BackgroundVideo()),
    );
    // }
  }

  @override
  Widget build(BuildContext context) {
    var _data1 = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 130,
              child: Image.asset('assets/images/AESTHENICSLOGO.png')),
            SizedBox(height:  60),
            CircularProgressIndicator(
              valueColor:AlwaysStoppedAnimation<Color>(Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
