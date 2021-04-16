import 'package:aesthenics/pages/productPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class sale extends StatefulWidget {
  @override
  _saleState createState() => _saleState();
}

class _saleState extends State<sale> {
  final CollectionReference _productsRef =FirebaseFirestore.instance.collection("Products");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _productsRef.get(),
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
                return Scaffold(
                  body: Center(
                    child: ListView(
                      padding: EdgeInsets.only(top: 108,bottom: 24,),
                      children: snapshot.data.docs.map((document){
                        return Center(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                    MaterialPageRoute(builder: (context) => productPage(productId:document.id)),);


                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0)
                                ),
                                height: 250,


                                margin: EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 24.0,
                                ),


                                child:Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(12.0),
                                        child: Image.network("${document.data()['images'][0]}",fit: BoxFit.cover,)),
                                    Positioned(
                                      bottom:0,
                                      child: Column(
                                        children: [

                                          Text(document.data()['name'],style: TextStyle(
                                              color: Colors.black45
                                          ),),
                                          Text(document.data()['price'],style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          ),),

                                        ],
                                      ),
                                    )
                                  ],

                                )


                            ),
                          ),
                        );

                      } ).toList(),
                    ),
                  )
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
