import 'package:aesthenics/Config/config.dart';
import 'package:aesthenics/services/firebase_services.dart';
import 'package:aesthenics/utils/AppColors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class cart extends StatefulWidget {
  final String productId;

  cart({this.productId});
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  final CollectionReference _productsRef = FirebaseFirestore.instance.collection("Products");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.currentUser.uid;
  }
  FirebaseServices _firebaseServices = FirebaseServices();
  @override

  Widget build(BuildContext context) {
    FirebaseServices _firebaseServices = FirebaseServices();
    User user =  FirebaseAuth.instance.currentUser;
    return new StreamBuilder(
      stream: getData(),
      builder: (context,snapshot){
        if (!snapshot.hasData) return const Text("Loading...");
        else if(snapshot.hasData){
          return Container(
            child: Column(
              children: <Widget>[
                ListView(
                 children: [
                  Text(snapshot.data["name"].toString(),style: TextStyle(
              color: Colors.black45,fontSize: 18
          ),),
                 ],
                ),
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
  Stream<DocumentSnapshot> getData()async*{
    //  var _firebaseAuth;
    User user = await FirebaseAuth.instance.currentUser;
    yield* FirebaseFirestore.instance.collection('Users').doc(user.uid).snapshots();
  }


}




