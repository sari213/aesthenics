import 'package:flutter/material.dart';

class newArrive extends StatefulWidget {
  @override
  _newArriveState createState() => _newArriveState();
}

class _newArriveState extends State<newArrive> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(

          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(

              child: Column(
                children: <Widget>[
                  SizedBox(height: 60,),
                  Text('#NEW ARRIVALS',style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 20,),
                  Container(
                    height: 700,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2 / 3,

                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemCount: 4,

                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            alignment: Alignment.bottomLeft,
                            child: Stack(
                              children: [
                                Image.asset('assets/images/t-shirt-sport.jpg',
                                    height: 220,
                                    fit:BoxFit.fill ),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8,bottom: 25),
                                      child: Text('T-Shirt-Blue',style: TextStyle(
                                          color: Colors.black45
                                      ),),
                                    )),
                                SizedBox(height: 10,),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8,bottom: 8),
                                      child: Text('Rs-499',style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),),
                                    )),

                                Padding(
                                  padding: const EdgeInsets.only(left: 110),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: FlatButton(
                                      onPressed: () {},
                                      child: Icon(Icons.favorite,color: Colors.black45),
                                      shape: CircleBorder(
                                        side: BorderSide(
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ),
                                  ),
                                )


                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                          );
                        }),
                  ),

                  /* Row(
                                  children: <Widget>[
                                    Container(
                                      width: 180,
                                      height: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ), //BoxD// ecoration
                                      child: Column(
                                        children: [
                                          Image.asset('assets/images/t-shirt-sport.jpg',
                                              height: 250,
                                              fit:BoxFit.fill ),
                                          Text('T-Shirt'),
                                          Text('499')

                                        ],
                                      ),
                                    ), //Conatiner
                                    SizedBox(
                                      width: 20,
                                    ), //SizedBox
                                    Container(
                                      width: 180,
                                      height: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ), //BoxD// ecoration
                                      child: Column(
                                        children: [
                                          Image.asset('assets/images/t-shirt-sport.jpg',
                                              height: 250,
                                              fit:BoxFit.fill ),
                                          Text('T-Shirt'),
                                          Text('499')


                                        ],
                                      ),
                                    ),  //Container
                                  ], //<Widget>[]
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 180,
                                      height: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ), //BoxD// ecoration
                                      child: Column(
                                        children: [
                                          Image.asset('assets/images/t-shirt-sport.jpg',
                                              height: 250,
                                              fit:BoxFit.fill ),
                                          Text('T-Shirt'),
                                          Text('499')


                                        ],
                                      ),
                                    ),  //Conatiner
                                    SizedBox(
                                      width: 20,
                                    ), //SizedBox
                                    Container(
                                      width: 180,
                                      height: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ), //BoxD// ecoration
                                      child: Column(
                                        children: [
                                          Image.asset('assets/images/t-shirt-sport.jpg',
                                              height: 250,
                                              fit:BoxFit.fill ),
                                          Text('T-Shirt'),
                                          Text('499')


                                        ],
                                      ),
                                    ),  //Container
                                  ], //<Widget>[]
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ), *///Row
                ], //<widget>[]

              ),
            ), //Column
          ) //Padding
      ),
    );

  }
}
