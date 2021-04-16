import 'package:aesthenics/Admin/uploadItems.dart';
import 'package:aesthenics/DialogBox/errorDialog.dart';
import 'package:aesthenics/utils/AppColors.dart';
import 'package:aesthenics/widgets/customTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';




class AdminSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.bg2,Colors.grey],
                    begin: FractionalOffset(00.00,00.00),
                    end: FractionalOffset(01.00,00.00),
                    stops: [0.0,1.0],
                    tileMode: TileMode.clamp
                )
            ),
          )
      ),
      body: AdminSignInScreen(),
    );
  }
}


class AdminSignInScreen extends StatefulWidget {
  @override
  _AdminSignInScreenState createState() => _AdminSignInScreenState();
}

class _AdminSignInScreenState extends State<AdminSignInScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _adminController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.bg2,Colors.grey],
                  begin: FractionalOffset(00.00,00.00),
                  end: FractionalOffset(01.00,00.00),
                  stops: [0.0,1.0],
                  tileMode: TileMode.clamp
              )
          ),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child:Image.asset("images/admin.png"),
                  height:240,
                  width: 240,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Admin",style: TextStyle(
                      color: Colors.black
                  ),),
                ),
                SizedBox(height: 10,),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      CustomTextField(
                          controller:_adminController,
                          data:Icons.person,
                          hintText:"id",
                          isObsecure:false

                      ),
                      CustomTextField(
                          controller:_passwordController,
                          data:Icons.person,
                          hintText:"password",
                          isObsecure:true

                      ),

                    ],

                  ),

                ),
                RaisedButton(onPressed:(){
                  _adminController.text.isNotEmpty
                      && _passwordController.text.isNotEmpty
                      ? loginAdmin()
                      :showDialog(context: context,
                      builder: (c){
                        return ErrorAlertDialog(message: "Please enter email and password",);
                      }
                  );

                },
                  color: AppColors.bg2,
                  child: Text("Login"),
                ),
                SizedBox(height: 50,),
                Container(
                  height: 4,
                  width: _screenWidth*0.8,
                  color: Colors.white,
                ),
                SizedBox(height: 20,),
                FlatButton.icon(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminSignInPage())),
                  icon: (Icon(Icons.nature_people,color: Colors.white)),
                  label: Text("I am not Admin",style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 50,),
              ]
          ),
        )
    );
  }

  loginAdmin(){
    FirebaseFirestore.instance.collection("admins").get().then((snapshot){
      snapshot.docs.forEach((result){
        if("${result.data()['id']}"!= _adminController.text.trim()){
         Scaffold.of(context).showSnackBar(SnackBar(content:Text("Your id is not correct."),));
        }
        else if("${result.data()['password']}"!= _passwordController.text.trim()){
          Scaffold.of(context).showSnackBar(SnackBar(content:Text("Your password is not correct."),));
        }
        else{
          Scaffold.of(context).showSnackBar(SnackBar(content:Text("Welcome Admin,"+ "${result.data()['name']}"),));

          setState(() {
            _adminController.text="";
            _passwordController.text="";

          });
          Route route = MaterialPageRoute(builder: (c)=>UploadPage());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }


}

