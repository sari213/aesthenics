import 'package:aesthenics/pages/Fhome.dart';
import 'package:aesthenics/pages/basket.dart';
import 'package:aesthenics/pages/cart.dart';


import 'package:aesthenics/pages/home.dart';
import 'package:aesthenics/pages/logIn.dart';
import 'package:aesthenics/pages/profile.dart';
import 'package:aesthenics/pages/search.dart';
import 'package:aesthenics/providers/tab_provider.dart';
import 'package:aesthenics/services/firebase_services.dart';
import 'package:aesthenics/utils/Constants.dart';
import 'package:aesthenics/utils/Utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinalHome extends StatefulWidget {
  @override
  _FinalHomeState createState() => _FinalHomeState();
}

class  _FinalHomeState extends State<FinalHome> {
  FirebaseServices firebaseServices = FirebaseServices();

  int currentTab =0;

  @override
  void initState(){
    print("UserId: ${firebaseServices.getUserId()}");
    super.initState();
  }


  final List<Widget> screens =[
    search(),
    logIn(),
    Fhome(),
    profile(),
    cart()
  ];
  Widget currentScreen = Fhome();
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:PageStorage(
        child: currentScreen,
        bucket: bucket,
      ) ,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
          margin: EdgeInsetsDirectional.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: (){
                  setState(() {
                    currentScreen=Fhome();
                    currentTab=0;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.home,color: currentTab==0? Colors.black45: Colors.black, ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 20,
                onPressed: (){
                  setState(() {
                    currentScreen=logIn(
                      isbackVisible: false,
                    );
                    currentTab=1;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.login,color: currentTab==1? Colors.black45: Colors.black, ),

                  ],
                ),
              ),
              MaterialButton(
                minWidth: 20,
                onPressed: (){
                  setState(() {
                    currentScreen=search();
                    currentTab=2;
                  });
                },
                child: Column(
                  children: [
                    Icon(Icons.search,color: currentTab==2?  Colors.black45: Colors.black, ),

                  ],
                ),
              ),
              MaterialButton(
                minWidth: 20,
                onPressed: (){
                  setState(() {
                    currentScreen=profile();
                    currentTab=3;
                  });
                },
                child: Column(
                  children: [
                    Icon(Icons.account_circle_rounded,color: currentTab==3? Colors.black45: Colors.black, ),

                  ],
                ),
              ),
              MaterialButton(
                minWidth: 20,
                onPressed: (){
                  setState(() {
                    currentScreen=cart();
                    currentTab=4;
                  });
                },
                child: Column(
                  children: [
                    Icon(Icons.shopping_cart,color: currentTab==4?  Colors.black45: Colors.black, ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
