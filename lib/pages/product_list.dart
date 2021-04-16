import 'package:aesthenics/pages/productPage.dart';
import 'package:aesthenics/services/firebase_services.dart';
import 'package:aesthenics/utils/AppColors.dart';
import 'package:aesthenics/utils/AppTextStyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;

class product_list extends StatefulWidget {
  final String productId;

  product_list({this.productId});


  @override
  _product_listState createState() => _product_listState();
}

class _product_listState extends State<product_list> {
  String _selectedProductSize = "0";

  FirebaseServices firebaseServices = FirebaseServices();
  final SnackBar snackBar = SnackBar(content: Text("Product added wishList"));


  Future _addToSaved(){
    return firebaseServices.usersRef
        .doc(firebaseServices.getUserId())
        .collection("Saved")
        .doc(widget.productId)
        .set({"size":_selectedProductSize});
  }
  final CollectionReference _productsRef = FirebaseFirestore.instance.collection("Products");


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
           // future: _fetchListItems(),
              future: _productsRef.get(),
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
                      children: [
                        SizedBox(height: 20,),
                        Center(child: Image.asset('assets/images/name.png',scale: 10,)),
                        SizedBox(height: 20,),
                        Text('Men’s Gym Wear',style: TextStyle(
                          fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black
                        ),),
                        SizedBox(height: 5,),

                        SizedBox(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black45)
                                  ),
                                    height: 35,
                                    width: double.infinity,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Center(child: IconButton(icon: Icon(Icons.format_align_center_outlined,size: 20,), onPressed: null)),
                                        Center(child: Text('FILTER',style: TextStyle(
                                          color:  AppColors.gray,
                                        ),))
                                      ],
                                    )),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black45)
                                  ),
                                  height: 35,
                                  width: double.infinity,

                                  child: Row(
                                    children: [
                                      Center(child: IconButton(icon: Icon(Icons.swap_vertical_circle_rounded,size: 20,), onPressed: null)),
                                      Center(child: Text('SORT BY',style: TextStyle(
                                          color: AppColors.gray
                                      ),))

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.count(
                              crossAxisCount: 2 ,
                              childAspectRatio: 2 / 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                              children: snapshot.data.docs.map((document) {
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => productPage(productId:document.id)),);


                                  },
                                  child: Container(


                                    child: Stack(
                                      children: [
                                        Image.network("${document.data()['images'][0]}",
                                          height: 220,
                                          fit: BoxFit.fitHeight,
                                        ),
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
                                        Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8,bottom: 8),
                                              child: Text("\₹${document.data()['price']}",style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),),
                                            )),
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: GestureDetector(
                                              onTap: ()async{
                                                await _addToSaved();
                                                print("added");
                                               // Scaffold.of(context).showSnackBar(snackBar);
                                              },

                                              child: Container(
                                                child: FlatButton(

                                  child: Icon(Icons.favorite,color: Colors.black45,size: 18,),
                                                  shape: CircleBorder(
                                                    side: BorderSide(

                                                        color: Colors.black45
                                                    ),
                                                  ),
                                  ),
                                              ),
                                            ),
                                            ),
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
                        )
                      ],
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

