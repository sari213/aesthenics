import 'package:aesthenics/pages/about.dart';
import 'package:aesthenics/pages/vedio.dart';
import 'package:aesthenics/services/firebase_services.dart';
import 'package:aesthenics/widgets/image_swipe.dart';
import 'package:aesthenics/widgets/product_size.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class productPage extends StatefulWidget {
  final String productId;

  productPage({this.productId});

  @override
  _productPageState createState() => _productPageState();
}

class _productPageState extends State<productPage> {
  int _n = 0;
  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0)
        _n--;
    });
  }


  FirebaseServices firebaseServices = FirebaseServices();



  String _selectedProductSize = "0";

  Future _addToCart(){
    return firebaseServices.usersRef
        .doc(firebaseServices.getUserId())
        .collection("cart")
        .doc(widget.productId)
        .set({"size":_selectedProductSize});
  }

  final SnackBar snackBar = SnackBar(content: Text("Product added to cart"));
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          FutureBuilder(
              future: firebaseServices.productsRef.doc(widget.productId).get(),
              builder: (context, snapshot){
                if(snapshot.hasError){
                  return SafeArea(
                    child: Scaffold(
                      body: Center(
                        child: Text('SomethingWentWrong'),
                      ),
                    ),
                  );


                }
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> documentData = snapshot.data.data();
                  List imageList = documentData['images'];
                  List productSizes = documentData['size'];
                  _selectedProductSize = productSizes[0];
                  return SafeArea(
                    child: Scaffold(
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20,),
                                Center(child: Image.asset('assets/images/name.png',scale: 10,)),
                                SizedBox(height: 20,),
                                image_swipe(imageList: imageList),
                                Center(
                                  child: Text("${documentData['name']}",style: TextStyle(
                                    fontSize: 20
                                  ),),
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: Container(
                                    height: 2,
                                    width: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: Text("Price:\₹${documentData['price']}",style: TextStyle(
                                      fontSize: 18
                                  ),),
                                ),
                               /* Center(
                                  child: Text("${documentData['desc']}",style: TextStyle(
                                      fontSize: 18
                                  ),),
                                ),*/
                                SizedBox(height: 10),

                                Center(
                                  child: Text('CHOOSE YOUR COLOR',style: TextStyle(
                                      fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black45
                                  ),),
                                ),
                                SizedBox(height: 10),

                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            border: Border.all(color: Colors.black)
                                        ),
                                        height: 40,
                                        width: 40,

                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            border: Border.all(color: Colors.black)
                                        ),
                                        height: 40,
                                        width: 40,
                                      //  color: Colors.blue,
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.purple,
                                            border: Border.all(color: Colors.black)
                                        ),
                                        height: 40,
                                        width: 40,
                                       // color: Colors.yellowAccent,
                                      ),




                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: Text('SIZE',style: TextStyle(
                                    fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black45
                                  ),),
                                ),
                                SizedBox(height: 10),

                                product_size(
                                    onSelected: (size){
                                      _selectedProductSize= size;
                                    },
                                    productSizes:productSizes),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex:1,
                                        child: Container(
                                          decoration: BoxDecoration(

                                                  border: Border.all(color: Colors.black45)
                                              ),
                                              //color: Colors.black,


                                          height: 50,
                                        //  width: 100,
                                          child: new Center(
                                            child: new Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Container(
                                                  height:30,
                                                  width: 30,
                                                  child: new FloatingActionButton(
                                                    elevation: 0,


                                                    onPressed: add,
                                                    child: new Icon(Icons.remove, color: Colors.black,),
                                                    backgroundColor: Colors.white,),
                                                ),

                                                new Text('$_n',
                                                    style: new TextStyle(fontSize: 14.0,color: Colors.black)),

                                                Container(
                                                  height:30,
                                                  width: 30,
                                                  child: new FloatingActionButton(
                                                    elevation: 0,
                                                    onPressed: minus,
                                                    child: new Icon(Icons.add,
                                                        color: Colors.black),
                                                    backgroundColor: Colors.white,),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex:3,
                                        child: MaterialButton(
                                          color: Colors.black,
                                          height: 50,
                                          onPressed: ()async{
                                            await _addToCart();
                                            Scaffold.of(context).showSnackBar(snackBar);
                                          },
                                          child: Text('ADD TO CART',style: TextStyle(
                                              fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white
                                          ),),
                                        ),
                                      ),
                                     /* GestureDetector(
                                        onTap: ()async{
                                          await _addToCart();
                                          Scaffold.of(context).showSnackBar(snackBar);
                                        },
                                        child: Expanded(
                                          flex: 2,
                                          child
                                              : Container(
                                            height: 50,
                                            decoration: BoxDecoration(

                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(0)
                                            ),
                                            child: Center(
                                              child: Text('ADD TO CART',style: TextStyle(
                                                  fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white
                                              ),),
                                            ),

                                          ),
                                        ),
                                      ),*/
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Center(
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(

                                        border: Border.all(color: Colors.black)
                                    ),
                                    child: MaterialButton(
                                      color: Colors.black,
                                      height: 30,
                                     /* onPressed: ()async{
                                        await _addToCart();
                                        Scaffold.of(context).showSnackBar(snackBar);
                                      },*/
                                      child: Text('CLICK HERE FOR SIZE GUIDE',style: TextStyle(
                                          fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black
                                      ),),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Text('PRODUCT VIDEO'),

                                VideoPlayerView(),

                                TextButton(onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => about()),
                                  );
                                }, child: Text('Description',style: TextStyle(
                                    color: Colors.black45
                                ),)),
                                Divider(
                                  height:1,
                                  color: Colors.black45,
                                ),
                                TextButton(onPressed: null, child: Text('Additional information',style: TextStyle(
                                    color: Colors.black45
                                ),)),
                                Divider(
                                  height: 1,
                                  color: Colors.black45,
                                ),

                                TextButton(onPressed: null, child: Text('Dilivery',style: TextStyle(
                                  color: Colors.black45,
                                ),)
                                ),



                              ],
                            ),
                          ),

                        )
                    ),
                  );
                }
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              }
          )
        ],
      ),
    );
  }
}
