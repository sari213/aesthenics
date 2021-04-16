import 'package:aesthenics/Config/config.dart';
import 'package:aesthenics/pages/productPage.dart';
import 'package:aesthenics/services/firebase_services.dart';
import 'package:aesthenics/utils/AppColors.dart';
import 'package:aesthenics/utils/AppTextStyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;

class test extends StatefulWidget {
  final String productId;

  test({this.productId});


  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  String _selectedProductSize = "0";
  FirebaseServices _firebaseServices = FirebaseServices();

  FirebaseServices firebaseServices = FirebaseServices();
  final SnackBar snackBar = SnackBar(content: Text("Product added wishList"));


  Future _addToSaved(){
    return firebaseServices.usersRef
        .doc(firebaseServices.getUserId())
        .collection("Saved")
        .doc(widget.productId)
        .set({"size":_selectedProductSize});
  }
  final CollectionReference _userRef = FirebaseFirestore.instance.collection("users");


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            // future: _fetchListItems(),
            future: _firebaseServices.usersRef
                .doc(_firebaseServices.getUserId())
                .collection('users').get(),
            builder: (context, snapshot){
              if (snapshot.hasError) {
                return SafeArea(
                  child: Scaffold(
                    body: Center(
                      child: Text('SomethingWentWrong'),
                    ),
                  ),
                );
              }
              if(snapshot.connectionState== ConnectionState.done){
                //display list of products
                return SafeArea(
                  child: Scaffold(
                    body: Column(

                          children: snapshot.data.docs.map((document) {
                            return Container(


                              child: Stack(
                                children: [

                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8,bottom: 25),
                                        child: Text(
                                          "${document.data()['name']}",style: TextStyle(
                                            color: Colors.black45
                                        ),),
                                      )),
                                  SizedBox(height: 10,),


                                  /* Card(

                                    child: Image.network("${document.data()['images'][0]}",
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Positioned(
                                    bottom:0,
                                      child: Container(
                                        color: Colors.white,

                                        child: Column(
                                          children: [
                                            Text(document.data()['name']),
                                            Text(document.data()['price'])
                                          ],

                                        ),
                                      ))*/
                                ],
                              ),
                            );
                          }).toList(),
                          /*children: List.generate(50,(index){
                            return Container(
                              child: Card(
                                color: Colors.blue,
                              ),
                            );
                          }),*/

                    ),
                  ),
                );
              }
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },

          )
        ],
      ),
    );
  }
}

