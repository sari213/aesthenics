import 'package:aesthenics/pages/product_list.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:tabbar/tabbar.dart';

class menu extends StatefulWidget {
  @override
  _menuState createState() => _menuState();
}
class _menuState extends State<menu> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.close),color: Colors.black,onPressed: ()=> Navigator.pop(context),),        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: TabbarHeader(
            //indicatorColor: Colors.black,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            controller: controller,
            tabs: [

              Tab(
                child: Text(
                  "WOMAN",
                  style: TextStyle(color: Colors.black,fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  "MAN",
                  style: TextStyle(color: Colors.black,fontSize: 20),
                ),
              ),

            ],
          ),
        ),
      ),
      body: TabbarContent(
        controller: controller,
        children: <Widget>[
          Container(color: Colors.white,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 100),
                  child: Text("NEW",style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold
                  ),),

                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Column(
                    children: [
                      ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment: ExpandablePanelHeaderAlignment.center,
                          tapBodyToExpand: true,
                          tapBodyToCollapse: true,
                          hasIcon: false,
                        ),
                        header:Container(
                          child: Text("COLLECTION",style: TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold
                          ),),
                        ) ,
                        expanded: buildList(),

                      )

                    ],

                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Text("SALE",style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,color: Colors.pink
                  ),),
                ),

              ],
            ),
          ),
          Container(color: Colors.white,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 100),
                  child: Text("NEW",style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Column(
                    children: [
                      ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment: ExpandablePanelHeaderAlignment.center,
                          tapBodyToExpand: true,
                          tapBodyToCollapse: true,
                          hasIcon: false,
                        ),
                        header:Container(
                          child: Text("COLLECTION",style: TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold
                          ),),
                        ) ,
                        expanded: buildList1(),

                      )

                    ],

                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Text("SALE",style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,color: Colors.pink
                  ),),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
  buildList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        TextButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => product_list()),
          );
        }, child:  Text('T-shirt',style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black
        ),),),
        TextButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => product_list()),
          );
        }, child:  Text('Tanktops',style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black
        ),),),
        TextButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => product_list()),
          );
        }, child:  Text('Sports Bra',style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black
        ),),),
        TextButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => product_list()),
          );
        }, child:  Text('Leggings/ Yoga Pant',style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black
        ),),),
        TextButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => product_list()),
          );
        }, child:  Text('Jackets and Hoodies',style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black
        ),),),
        TextButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => product_list()),
          );
        }, child:  Text('Shorts',style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black
        ),),),

      ],
    );
  }
  buildList1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text('T-shirt',style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold
        ),),SizedBox(
          height: 10,
        ),
        Text('Tanktops',style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold
        ),),SizedBox(
          height: 10,
        ),
        Text('Stringers',style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold
        ),),SizedBox(
          height: 10,
        ),
        Text('Joggers',style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold
        ),),SizedBox(
          height: 10,
        ),Text('Compression',style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold
        ),),SizedBox(
          height: 10,
        ),
        Text('Jackets and Hoodies ',style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold
        ),),SizedBox(
          height: 10,
        ),
        Text('Shorts',style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold
        ),),

      ],
    );
  }
}