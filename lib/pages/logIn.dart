
import 'package:aesthenics/Admin/adminLogin.dart';
import 'package:aesthenics/pages/FinalHome.dart';
import 'package:aesthenics/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forgot_password.dart';
import 'home.dart';
import 'homePage.dart';

class logIn extends StatefulWidget {
  bool isbackVisible;
  bool _isObscure = true;


   logIn({Key key, this.isbackVisible}) : super(key: key);

  @override
  _logInState createState() => _logInState(
    this.isbackVisible
  );
}

class _logInState extends State<logIn> {
  String email ="";
  String password="";
  bool registerForm = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void>_alertDialogBuilder(String error)async{

    return showDialog(context: context,
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(
            title: Text('Error'),
            content: Container(
              child: Text('error'),
            ),
            actions: [
              FlatButton(onPressed:(){
                Navigator.pop(context);
              }, child: Text('close'))
            ],
          );
        }


    );
  }
  Future<String>logInAccount()async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        return('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return('The account already exists for that email.');
      }
      return e.message;
    }
    catch(e){
      return e.toString();
    }
  }
  void submitForm() async{
    setState(() {
      registerForm = true ;
    });
    String signInAccountFeedback = await logInAccount();
    if(signInAccountFeedback != null){
      _alertDialogBuilder(signInAccountFeedback);


      setState(() {
        registerForm = false;
      });}
    else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FinalHome()),
      );
    }
  }
  bool isbackVisible;
  _logInState(this.isbackVisible);


  @override
  void initState() {
    if(widget.isbackVisible==null){
      widget.isbackVisible=false;
    }
    // TODO: implement initState

    super.initState();
  }
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: isbackVisible?IconButton(icon: Icon(Icons.arrow_back),color: Colors.black,onPressed: ()=> Navigator.pop(context),):Container(),
        title: Text("LOG IN",style: TextStyle(
            color: Colors.black
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //
            SizedBox(
              height: 30,
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
            Text("WELCOME TO",style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.bold,
            ),),
            Text("AESTHENICS TRAINING",style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.bold,
            )),
            SizedBox(
              height: 20,
            ),
            Text("HOME OF CONDITIONING COMMUNITY"),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Email",style: TextStyle(
                      fontSize: 14,fontWeight: FontWeight.bold
                  ),)),
            ),
            SizedBox(
              height: 10,
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
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("PASSWORD",style: TextStyle(
                            fontSize: 12,fontWeight: FontWeight.bold
                        ),),
                      ),

                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => forgot_password()),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 40,
                child: TextField(
                  controller: passwordController,
                  onChanged: (value){
                    password= value;
                  },
                  obscureText: _isObscure,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(4),
                      suffixIcon: IconButton(
                          icon: Icon(
                              _isObscure ? Icons.visibility_off : Icons.visibility,color: Colors.black,),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    border: OutlineInputBorder(),
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
                  onPressed: ()async {
                    submitForm();

                  },
                  child: Text(
                    'LOG IN',
                    style: TextStyle(color: Colors.black45, fontSize: 14,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            FlatButton.icon(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminSignInPage())),
              icon: (Icon(Icons.nature_people,color: Colors.black,)),
              label: Text("I am Admin",style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.bold
              ),),
            )

          ],
        ),
      ),
    );
  }
}
