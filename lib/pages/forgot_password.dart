
import 'package:aesthenics/pages/logIn.dart';
import 'package:aesthenics/utils/AppColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class forgot_password extends StatefulWidget {

  @override
  _forgot_passwordState createState() => _forgot_passwordState();
}
Future sendPasswordResetEmail(String email)async{
  return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);}

class _forgot_passwordState extends State<forgot_password> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email ="";
  String password="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.black,onPressed: ()=> Navigator.pop(context),),
        title: Text("RESET YOUR PASSWORD",style: TextStyle(
            color: Colors.black
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //
            SizedBox(
              height: 50,
            ),
            Container(
                height: 50,
                width: 50,
                child: Image.asset('assets/images/AESTHENICSLOGO.png')),
            Container(
              //height: 50,
                width: 100,
                child: Image.asset('assets/images/name.png')),
            SizedBox(
              height: 30,
            ),
            Text("RESET YOUR PASSWORD",style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.bold,
            ),),

            SizedBox(
              height: 20,
            ),
            Text("We will send you an email to reset your password"),
            Text("password."),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("EMAIL",style: TextStyle(
                      fontSize: 12,fontWeight: FontWeight.bold
                  ),)),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 40,
                child: TextField(
                  controller: nameController,
                  onChanged: (value){
                    email= value;
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(4),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    // fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.black ),
                    ),

                    /*labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'*/
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 40,
                width: 370,
                decoration: BoxDecoration(
                    color: AppColors.bg2, borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                  /*  FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) => print("check your mail"));

                    Navigator.pop(context);*/
                    resetPassword();

                  },
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(color: Colors.black45, fontSize: 15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            //Text("Or return to Log In"),
            Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Or return to ',
                        style: TextStyle(
                            color: Colors.black, fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(text: ' Log In',
                              style: TextStyle(
                                color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => logIn(isbackVisible:true)),

                                  );
                                  // navigate to desired screen
                                }
                          )
                        ]
                    ),
                  ),
                )
            )


          ],
        ),
      ),
    );
  }

  Future<String>resetPassword()async {

      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: email);


  }
}
