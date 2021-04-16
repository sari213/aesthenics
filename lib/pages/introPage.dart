import 'package:aesthenics/pages/logIn.dart';
import 'package:aesthenics/pages/pageview.dart';
import 'package:aesthenics/pages/signUp.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';



class BackgroundVideo extends StatefulWidget {


  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  final List<String> letters = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
];

 // PageController controller;
  int _currentPage = 0;
  // TODO 4: Create a VideoPlayerController object.
  VideoPlayerController _controller;
  final controller = PageController();

  // TODO 5: Override the initState() method and setup your VideoPlayerController
  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/video.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }


  @override
  Widget build(BuildContext context) {
    PageController controller;
    int _currentPage = 0;
    return MaterialApp(
      theme: ThemeData(

        // Adjusted theme colors to match logo.
        primaryColor: Color(0xffb55e28),
        accentColor: Color(0xffffd544),
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          // TODO 6: Create a Stack Widget
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              // TODO 7: Add a SizedBox to contain our video.
              SizedBox.expand(
                child: FittedBox(
                  // If your background video doesn't look right, try changing the BoxFit property.
                  // BoxFit.fill created the look I was going for.
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size?.width ?? 0,
                    height: _controller.value.size?.height ?? 0,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              Center(
                child: Text('AESTHENICS',style: TextStyle(
                  fontSize: 40,fontWeight: FontWeight.bold,
                    color: Colors.white,fontStyle: FontStyle.normal
                ),),
              ),
              pageview(),






              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(

                        onPressed: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => signUp(

                            )),
                          );
                        }, child: Text("SIGN UP",style: TextStyle(
                        color: Colors.white,fontSize: 18
                    ),)),
                    TextButton(

                        child: Text("|",style: TextStyle(
                            color: Colors.white,fontSize: 28
                        ),)),
                    TextButton( onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => logIn(
                          isbackVisible: true,
                        )),
                      );
                    }, child: Text("LOG IN",style: TextStyle(
                        color: Colors.white,fontSize: 18
                    ),))
                  ],
                ),
              ),

              //LoginWidget()
            ],
          ),
        ),
      ),
    );
  }

  // TODO 8: Override the dipose() method to cleanup the video controller.
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
