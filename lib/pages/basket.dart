import 'package:aesthenics/pages/productPage.dart';
import 'package:aesthenics/providers/tab_provider.dart';
import 'package:aesthenics/services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class basket extends StatefulWidget {
/*  final String productId;

  basket({this.productId});*/

  @override
  _basketState createState() => _basketState();
}

class _basketState extends State<basket> {
  List<int> product_count = [];

  void add(int index, double price) {
    final provider = Provider.of<TabIndex>(context, listen: false);
    setState(() {
      //_n++;
      int count = product_count[index];
      count++;
      provider.addTotal(price * count);
      try {
        product_count[index] = count;
      } catch (e) {}
      print(count);
    });
  }

  void minus(int index, double price) {
    final provider = Provider.of<TabIndex>(context, listen: false);
    setState(() {
      int count = product_count[index];
      if (count != 0) {
        count--;
        provider.minusTotal(price * count);
        try {
          product_count[index] = count;
        } catch (e) {}
        print(count);
      }
    });
  }

  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'SHOPPING CART',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder<QuerySnapshot>(
                future: _firebaseServices.usersRef
                    .doc(_firebaseServices.getUserId())
                    .collection('cart')
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text("Error: ${snapshot.error}"),
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                        child: ListView(
                            children: snapshot.data.docs
                                .asMap()
                                .map((index, document) => MapEntry(
                                    index,
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => productPage(
                                                  productId: document.id)),
                                        );
                                      },
                                      child: FutureBuilder(
                                          future: _firebaseServices.productsRef
                                              .doc(document.id)
                                              .get(),
                                          builder: (context,  productSnap) {
                                            if (productSnap.hasError) {
                                              return Container(
                                                child: Center(
                                                  child: Text(
                                                      "${productSnap.error}"),
                                                ),
                                              );
                                            }
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              // for(int i=0; i< productSnap.data)
                                              Map _productMap =
                                                  productSnap.data.data();
                                              if (product_count.isEmpty) {
                                                for (int i = 0; i < snapshot.data.docs.length;
                                                    i++) {
                                                  product_count.add(1);
                                                }
                                              }

                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black45),
                                                          ),
                                                          child:
                                                              IconButton(icon: Icon(Icons.close),onPressed: (){
                                                                FirebaseFirestore.instance.collection("cart").doc(document.id).delete().whenComplete(() {
                                                                  Navigator.pop(context);
                                                                });

                                                              },),
                                                        ),
                                                        Container(
                                                          width: 70,
                                                          height: 70,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              "${_productMap["images"][0]}",
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "${_productMap['name']}",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      18.0,
                                                                  color: Colors
                                                                      .black45,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                vertical: 4.0,
                                                              ),
                                                              child: Text(
                                                                "\₹${_productMap['price']}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16.0,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                            Text(
                                                              "Size - ${document.data()['size']}",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16.0,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black45)),
                                                        //color: Colors.black,

                                                        height: 30,
                                                        width: 80,
                                                        child: new Center(
                                                          child: new Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: <Widget>[
                                                              Container(
                                                                height: 20,
                                                                width: 30,
                                                                child:
                                                                    new FloatingActionButton(
                                                                  elevation: 0,
                                                                  onPressed:
                                                                      () {
                                                                        minus(
                                                                            index,double.parse( _productMap[
                                                                        'price'])
                                                                        );
                                                                  },
                                                                  child:
                                                                      new Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                              ),
                                                              new Text(
                                                                  "${product_count[index]}",
                                                                  style: new TextStyle(
                                                                      fontSize:
                                                                          14.0,
                                                                      color: Colors
                                                                          .black)),
                                                              Container(
                                                                height: 30,
                                                                width: 30,
                                                                child:
                                                                    new FloatingActionButton(
                                                                  elevation: 0,
                                                                  onPressed:
                                                                      () {
                                                                    add(
                                                                        index,double.parse( _productMap[
                                                                    'price'])
                                                                       );

                                                                    Fluttertoast.showToast(
                                                                        msg: "$index",
                                                                        toastLength: Toast.LENGTH_SHORT,
                                                                        gravity: ToastGravity.CENTER,
                                                                        // timeInSecForIos: 1,
                                                                        backgroundColor: Colors.red,
                                                                        textColor: Colors.white,
                                                                        fontSize: 16.0);
                                                                  },
                                                                  child: new Icon(
                                                                      Icons.add,
                                                                      color: Colors
                                                                          .black),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                            return Container(
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          }),
                                    )
                            )
                            )
                                .values.toList()));
                  }
                  return CircularProgressIndicator();

                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CART DETAILS",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Divider(),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Subtotal",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Consumer<TabIndex>(builder: (context, cart, child) {
                        return Text(
                          "${cart.carttotal}",
                          style: TextStyle(
                              color: Color(0xFF6C6D6D),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Discount",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "0.0",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                      //height: 2.0,
                      ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Cart Total",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Consumer<TabIndex>(builder: (context, cart, child) {
                        return Text(
                          "${cart.carttotal-100}",
                          style: TextStyle(
                              color: Color(0xFF6C6D6D),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    height: 50,
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    onPressed: () {},
                    child: Text(
                      "Proceed To Checkout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget getList() {
    /* return  ListView(
      //   padding: EdgeInsets.only(top: 30,bottom: 24,),
      children: snapshot.data.docs.map((document){
        return GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => productPage(productId:document.id)),);
          },
          child: FutureBuilder(
              future: _firebaseServices.productsRef.doc(document.id).get(),
              builder: (context,productSnap) {
                if (productSnap.hasError) {
                  return Container(
                    child: Center(
                      child: Text("${productSnap.error}"),
                    ),
                  );
                }
                if (snapshot.connectionState ==
                    ConnectionState.done) {
                  Map _productMap = productSnap.data.data();
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          children: [
                            Container(
                              decoration:BoxDecoration(
                                border: Border.all(color: Colors.black45),

                              ),
                              child: Icon(Icons.close),
                            ),
                            Container(
                              width: 70,
                              height: 70,
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(8.0),
                                child: Image.network(
                                  "${_productMap["images"][0]}",
                                  fit: BoxFit.cover,),),),
                            Column(
                              mainAxisAlignment: MainAxisAlignment
                                  .start,
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children: [
                                Text(
                                  "${_productMap['name']}",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black45,
                                      fontWeight: FontWeight
                                          .w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets
                                      .symmetric(
                                    vertical: 4.0,
                                  ),
                                  child: Text(
                                    "\₹${_productMap['price']}",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight
                                            .w600),),),
                                Text("Size - ${document
                                                        .data()['size']}",
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .w600),
                                                    ),
                              ],),
                          ],
                        ),
                        Align(
                          alignment:Alignment.centerRight,
                          child: Container(
                            decoration: BoxDecoration(

                                border: Border.all(color: Colors.black45)
                            ),
                            //color: Colors.black,


                            height: 30,
                            width: 80,
                            child: new Center(
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height:20,
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
                      ],
                    ),
                  );
                }
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }),


        );


      }).toList(),

    );*/
  }
}
