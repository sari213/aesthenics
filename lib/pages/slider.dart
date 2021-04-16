import 'package:aesthenics/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';


class ProductCard1 extends StatelessWidget {

  final String productId;
  final List imageList;


  ProductCard1({this.productId,this.imageList});
  FirebaseServices firebaseServices = FirebaseServices();
  String _selectedProductSize = "0";

  @override
  Widget build(BuildContext context) {
    var widget;
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: SizedBox(
        child: GestureDetector(
         /* onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: product),
          ),*/
          child: FutureBuilder(
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
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    AspectRatio(
    aspectRatio: 1.02,
    child: Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
    //       color: kSecondaryColor.withOpacity(0.1),
    borderRadius: BorderRadius.circular(15),
    ),
    child: Hero(
    tag: productId.toString(),
    child:Image.network("${imageList[0]}",fit: BoxFit.cover,
    ),
    ),
    ),
    ),
    const SizedBox(height: 10),
    Text("${documentData['name']}",
    style: TextStyle(color: Colors.black),
    maxLines: 2,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(
    "${documentData['price']}",

    ),
    InkWell(
    borderRadius: BorderRadius.circular(50),
    onTap: () {},
    child: Container(
    padding: EdgeInsets.all(8),
    height: 28,
    width: 28,
    /* decoration: BoxDecoration(
                          color: product.isFavourite
                              ? kPrimaryColor.withOpacity(0.15)
                              : kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),*/
    /* child: SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          color: product.isFavourite
                              ? Color(0xFFFF4848)
                              : Color(0xFFDBDEE4),
                        ),*/
    ),
    ),
    ],
    )
    ],


    );
    }
    }
    )
    )
    )
    );

}
  }


