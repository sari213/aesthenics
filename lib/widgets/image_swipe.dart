import 'package:flutter/material.dart';

class image_swipe extends StatefulWidget {
  final List imageList;
  image_swipe({this.imageList});
  @override
  _image_swipeState createState() => _image_swipeState();
}

class _image_swipeState extends State<image_swipe> {
  int _selectedPage=0;
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 420,
      child: Column(
        children: [
          Container(
        height: 300,
                child: Hero(
                  tag: widget.imageList,

                  child: Image.network(
                    "${widget.imageList[selectedImage]}",fit: BoxFit.cover,
                  ),
                ),
              ),
          SizedBox(height: 10,),

          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(widget.imageList.length,
                      (index) => buildSmallProductPreview(index)),
            ],
          ),
         /* Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(var i=0; i<widget.imageList.length; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedImage = i;
                    });
                  },

                  child: AnimatedContainer(
                    duration: Duration(
                        microseconds: 300
                    ),
                    curve: Curves.easeOutCubic,
                    margin: EdgeInsets.symmetric(
                        horizontal: 5
                    ),
                    // width: _selectedPage==i ?25 :12,
                    height: 100,
                    width: 80,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black.withOpacity(0.5),

                    ),
                    child: Image.network(
                      "${widget.imageList[i]}",fit: BoxFit.cover,
                    ),
                  ),
                )


            ],
          )*/

        ],
      ),

    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return  GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
          print(selectedImage);
        });
      },

      child: AnimatedContainer(
        duration: Duration(
            microseconds: 300
        ),
        curve: Curves.easeOutCubic,
        margin: EdgeInsets.symmetric(
            horizontal: 5
        ),
        // width: _selectedPage==i ?25 :12,
        height: 100,
        width: 80,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black.withOpacity(0.5),

        ),
        child: Image.network(
          "${widget.imageList[index]}",fit: BoxFit.cover,
        ),
      ),
    );



  }
}
