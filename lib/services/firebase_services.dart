import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices{
 /* storeNewUser(user, context)async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();

  }*/

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  String getUserId(){
    return _firebaseAuth.currentUser.uid;
  }

  final CollectionReference productsRef =
  FirebaseFirestore.instance.collection("Products");

  final CollectionReference usersRef =
  FirebaseFirestore.instance.collection("Users");

  final CollectionReference cartRef =
  FirebaseFirestore.instance.collection("cart");



}