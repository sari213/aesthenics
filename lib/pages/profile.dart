

import 'package:aesthenics/Config/config.dart';
import 'package:aesthenics/pages/wishList.dart';
import 'package:aesthenics/services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {

  FirebaseServices _firebaseServices ;
  @override
  void initState() {// TODO: implement initStsuper.initState();
    Future.delayed(Duration.zero).then((_) async {
      _firebaseServices = FirebaseServices();});
    print(EcommerceApp.userUID);
    FirebaseFirestore.instance.collection("users").doc(EcommerceApp.userUID).get();}
    @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*  IconButton(icon: Icon(Icons.close),color: Colors.black,iconSize: 30,
                  onPressed: ()=> Navigator.pop(context),),*/
                Center(child: Image.asset('assets/images/AESTHENICSLOGO.png',scale: 10,)),
                SizedBox(
                  height: 20,

                ),
                Container(
                  height: 80,
                  width: double.infinity,
                  color: Colors.black12,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('MY ACCOUNT',style: TextStyle(fontSize: 20),),
                      Text('DASHBOARD',style: TextStyle(
                          color: Colors.grey
                      ),)
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),

                Row(
                  children: [
                    Icon(Icons.account_circle_rounded,size: 80,color: Colors.grey,),
                    StreamBuilder(
                      stream: getData(),
                      builder: (context,snapshot){
                        if (!snapshot.hasData) return const Text("Loading...");
                        else if(snapshot.hasData){
                          return Container(
                            child: Column(
                              children: <Widget>[
                                Text(snapshot.data["name"].toString(),style: TextStyle(
                                    color: Colors.black45,fontSize: 18
                                ),),
                              ],
                            ),
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    )



                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(onPressed: null, child: Text('ORDERS',style: TextStyle(
                    color: Colors.black45
                ),)),
                Divider(
                  height: 1,
                  color: Colors.black45,
                ),
                TextButton(onPressed: null, child: Text('ADDRESSES',style: TextStyle(
                    color: Colors.black45
                ),)),
                Divider(
                  height: 1,
                  color: Colors.black45,
                ),
                TextButton(onPressed: null, child: Text('ACCOUNT DETAILS',style: TextStyle(
                    color: Colors.black45
                ),)),
                Divider(
                  height: 1,
                  color: Colors.black45,
                ),
                TextButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => wishList()));

                }, child: Text('WISHLIST',style: TextStyle(
                    color: Colors.black45
                ),)),
                Divider(
                  height: 1,
                  color: Colors.black45,
                ),
                TextButton(onPressed:(){
                  FirebaseAuth.instance.signOut();
                }, child: Text('LOGOUT',style: TextStyle(
                    color: Colors.black45
                ),)),

              ],
            ),
          ),
        ),

      ),
    );
  }
/*  _fetch()async{
    final firebaseUser =await FirebaseAuth.instance.currentUser;
    if(firebaseUser!=null)await
      FirebaseFirestore.instance.collection("users")
          .doc(firebaseUser.uid).get();

  }*/
  Stream<DocumentSnapshot> getData()async*{
  //  var _firebaseAuth;
    User user = await FirebaseAuth.instance.currentUser;
    yield* FirebaseFirestore.instance.collection('Users').doc(user.uid).snapshots();
  }
}

