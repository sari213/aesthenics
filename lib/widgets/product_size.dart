import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class product_size extends StatefulWidget {
  final List productSizes;
  final Function(String) onSelected;
  product_size({this.productSizes, this.onSelected});
  @override
  _product_sizeState createState() => _product_sizeState();
}

class _product_sizeState extends State<product_size> {
  int _selected =0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(var i=0; i<widget.productSizes.length; i++)
          GestureDetector(
            onTap: (){
              widget.onSelected("${widget.productSizes[i]}");
              setState(() {

                _selected= i;
              });
            },
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: _selected==i?Colors.black: Colors.white,
                  border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(0),),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                horizontal: 4
              ),
              child: Text("${widget.productSizes[i]}",style:TextStyle(color: _selected==i?Colors.white: Colors.black,)),
            ),
          )


      ],
    );
  }
}
