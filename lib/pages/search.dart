import 'package:aesthenics/pages/productPage.dart';
import 'package:aesthenics/services/firebase_services.dart';
import 'package:aesthenics/widgets/customInput.dart';
import 'package:aesthenics/widgets/productCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  FirebaseServices _firebaseServices = FirebaseServices();
  String _searchString = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          if (_searchString.isEmpty)
            Center(child: Text("Search Results"))
          else
          FutureBuilder<QuerySnapshot>(
              future: _firebaseServices.productsRef .orderBy("name")
                  .startAt([_searchString]).endAt(
                  ["$_searchString\uf8ff"]).get(),
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: CustomInput (
              hintText: "Search here...",
              onSubmitted: (value) {
                if (value.isNotEmpty){
                  setState(() {
                    _searchString = value.toLowerCase();
                  });

                }
              },
            ),
          ),
         // Center(child: Text('data')),
        ],
      )
    );
  }
}