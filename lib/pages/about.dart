import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class about extends StatefulWidget {
  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.black,
                  child: Center(
                    child: Text('OUR STORY',style: TextStyle(
                      fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white
                    ),),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text('ABOUT US',style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text('We were a pair of college students and entrepreneur from India with a passion for fitness and fashion. As years went by, we became more and more involved in fitness because it was the best release for hectic and stressful routines. We found ourselves frustrated and perplexed by how difficult it was to find the best in class gym wear that could stand up to seriously intense workouts and also give off a superb look. ',style: TextStyle(

                    ),),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text('That’s when we got the idea for AESTHENICS.  It was clear to us that many of the big brands were already offering best in class quality. However, their products were too expensive. We set out to challenge to offer gym gear with similar best in class quality and style but most importantly, at a reasonable rate which is affordable to everyone.')
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text('Every product on our shop has been designed for active life from fit to stitch to fabric with gym goers in mind, and to fulfill our vision of what gym wear should be. Born in India, we have enlisted loads of Indian trainers and everyday gym goers in our local community to help us design our products, select our fabrics and other materials. And we have loved every minute of it.'),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text('It comes down to this: We believe that good things come to those who sweat, and that good gym wear should help you feel good and look good while you sweat.'),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   child: Text('That’s our story. We are AESTHENICS.  Born in India. Engineered for GYM.'),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
