import 'dart:io';

import 'package:aesthenics/Config/config.dart';
import 'package:aesthenics/DialogBox/errorDialog.dart';
import 'package:aesthenics/DialogBox/loadingDialog.dart';
import 'package:aesthenics/pages/FinalHome.dart';
import 'package:aesthenics/pages/logIn.dart';
import 'package:aesthenics/utils/AppColors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class signUp extends StatefulWidget {
  bool _isObscure = true;
  final Function(String) onChanged;
  final Function(String) onSubmit;
  signUp({this.onChanged,this.onSubmit});

  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  static get isLoading => null;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userImageUrl = "";
  File _imageFile;


  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Container(
              child: Text('error'),
            ),
            actions: [
              FlatButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text('close'))
            ],
          );
        }


    );
  }

  Future<String> createAccount() async {
    try {

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return ('The account already exists for that email.');
      }
      return e.message;
    }
    catch (e) {
      return e.toString();
    }
  }

  void submitForm() async {
    setState(() {
      registerForm = true;
    });
    String createAccountFeedback = await createAccount();
    if (createAccountFeedback != null) {
      _alertDialogBuilder(createAccountFeedback);


      setState(() {
        registerForm = false;
      });
    }
    else {
      Navigator.pop(context);
    }
  }


  bool _checkbox = false;
  bool _checkboxListTile = false;
  bool _isObscure = true;
  bool _isLoading = isLoading ?? false;
  bool registerForm = false;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double _screenheight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),),
        title: Text("CREATE AN ACCOUNT", style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /*InkWell(
              onTap: _selectAndPickImage,
              child: CircleAvatar(
                radius: _screenWidth * 0.15,
                backgroundColor: Colors.white,
                backgroundImage: _imageFile == null ? null : FileImage(
                    _imageFile),
                child: _imageFile == null ? Icon(Icons.add_photo_alternate,
                  size: _screenWidth * 0.15, color: Colors.grey,)
                    : null,

              ),
            ),*/

            SizedBox(
              height: 30,
            ),
            Container(
                height: 50,
                width: 50,
                child: Image.asset('assets/images/AESTHENICSLOGO.png')),

            SizedBox(
              height: 15,
            ),


            Text("Take the first step to unlocking your potential.",
              style: TextStyle(
                  fontSize: 16
              ),),
            Text(
              "If you have already got Aesthenics account,", style: TextStyle(
                fontSize: 16
            ),),
            Text("please log in using your existing information.",
              style: TextStyle(
                  fontSize: 16
              ),),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("FIRST NAME", style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold
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
                  controller: _nameController,
                  cursorColor: Colors.black,
                  //  keyboardType: TextInputType.text,
                  autofocus: true,
                  //  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(4),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    // fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),

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
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("LAST NAME", style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold
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
                  controller: _lastnameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(4),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    // fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
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
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("EMAIL", style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold
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
                  controller: _emailController,
                  onChanged: (value) {
                    email = value;
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(4),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    // fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
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
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("PASSWORD", style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold
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
                  controller: _passwordController,
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: _isObscure,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(4),
                    suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black,),
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
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("MOBILE", style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold
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
controller: _mobileController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(4),
                    focusedBorder: OutlineInputBorder(

                      borderSide: BorderSide(color: Colors.black),
                    ),
                    // fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),

                    /*labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'*/
                  ),
                ),
              ),
            ),

            SizedBox(
                height: 10),
            CheckboxListTile(
              activeColor: Colors.black,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                'By selecting this box, I acknowledge I am over the age of 18 and I have read and understand The App User Agreement and the Privacy Policy.',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
              value: _checkboxListTile,
              onChanged: (value) {
                setState(() {
                  _checkboxListTile = !_checkboxListTile;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Stack(
                children: [
                  Container(
                    height: 40,
                    width: 370,
                    decoration: BoxDecoration(
                        color: AppColors.bg2,
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: () async {
                        uploadAndSaveImage();
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>logIn()));
                      },
                      child: Visibility(
                        visible: _isLoading ? false : true,
                        child: Center(
                          child: Text(
                            'CREATE ACCOUNT',
                            style: TextStyle(color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                    ),

                  ),
                  Visibility(
                    visible: _isLoading,
                    child: Center(
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(

                          )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            //Text("Or return to Log In"),
          ],
        ),
      ),
    );
  }
  Future<void>_selectAndPickImage()async{
    _imageFile= await ImagePicker.pickImage(source: ImageSource.gallery);
  }
  Future<void> uploadAndSaveImage()async{
    _emailController.text.isNotEmpty&&
          _passwordController.text.isNotEmpty &&
          _lastnameController.text.isNotEmpty&&
          _nameController.text.isNotEmpty

          ?_registerUser()

          :displayDialog("Please write the  complete form");

  }
  displayDialog(String msg){
    showDialog(context: context,
        builder: (c){
          return ErrorAlertDialog(message: msg);}

    );
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  void _registerUser()async{
    User firebaseUser;
    await _auth.createUserWithEmailAndPassword(email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    ).then((auth){
      firebaseUser = auth.user;
    }).catchError((error){
      Navigator.pop(context);
      showDialog(context: context,
          builder: (c){
            return ErrorAlertDialog(message: error.message.toString(),);
          }
      );
    });
    if (firebaseUser!=null){
      saveUserInfoToFireStore(firebaseUser).then((value){
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (c)=>FinalHome());
        Navigator.pushReplacement(context, route);
      });
    }
  }
  Future saveUserInfoToFireStore(User fUser) async {
    FirebaseFirestore.instance.collection("Users").doc(fUser.uid).set({
      "uid": fUser.uid,
      "email": fUser.email,
      "name": _nameController.text.trim(),
      "lastname": _lastnameController.text.trim(),
      "mobile": _mobileController.text.trim(),
      "password": _passwordController.text.trim(),
    //  "url": userImageUrl,
      // EcommerceApp.userCartList: ["garbageValue"]

    });

  }
}