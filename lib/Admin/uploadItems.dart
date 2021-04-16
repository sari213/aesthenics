import 'dart:io';
import 'package:aesthenics/pages/introPage.dart';
import 'package:aesthenics/utils/AppColors.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class UploadPage extends StatefulWidget
{
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> with AutomaticKeepAliveClientMixin<UploadPage>
{
  bool get wantKeepAlive => true;
File file;
TextEditingController _descriptionTextEditingController = TextEditingController();
  TextEditingController _priceTextEditingController = TextEditingController();
  TextEditingController _titleTextEditingController = TextEditingController();
  TextEditingController _shortInfoTextEditingController = TextEditingController();
  String productId = DateTime.now().microsecondsSinceEpoch.toString();
  bool uploading = false;


  @override
  Widget build(BuildContext context) {
    return file== null ?displayAdminHomeScreen() :displayAdminUploadFormScreen();
  }
  displayAdminHomeScreen(){
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.bg2,Colors.grey],
                  begin: FractionalOffset(00.00,00.00),
                  end: FractionalOffset(01.00,00.00),
                  stops: [0.0,1.0],
                  tileMode: TileMode.clamp
              )
          ),
        ),
       /* leading: IconButton(
          icon: Icon(Icons.border_color,color: Colors.white,),
          onPressed: (){
           *//* Route route = MaterialPageRoute(builder: (c)=>AdminShiftOrders());
            Navigator.pushReplacement(context, route);*//*
          },
        ),*/
        title: Text('AESTHENICS',style: TextStyle(
            fontFamily: "Signatra",color: Colors.black
        ),),
        centerTitle: true,

        actions: [
          FlatButton(child: Text("LogOut",style: TextStyle(
            color: Colors.black,fontWeight: FontWeight.bold
          ),
          ),
            onPressed: (){
              Route route = MaterialPageRoute(builder: (c)=>BackgroundVideo());
              Navigator.pushReplacement(context, route);
            },

          ),

        ],
      ),
      body: getAdminHomeScreenBody(),

    );
  }
  getAdminHomeScreenBody(){
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.bg2,Colors.grey],

              begin: FractionalOffset(00.00,00.00),
              end: FractionalOffset(01.00,00.00),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp
          )
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shop_two,size: 50,),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RaisedButton(
                child: Text("ADD NEW ITEMS"),
                onPressed: ()=>takeImage(context),
              ),
            )

          ],
        ),
      ),
    );
  }
  takeImage(mcontext){
    showDialog(context: mcontext,
    builder:(c){
      return SimpleDialog(
        title: Text("Item Image",style: TextStyle(
          color: Colors.black45,fontWeight: FontWeight.bold
        ),),
        children: [
          SimpleDialogOption(
            child: Text("Capture with Camera",style: TextStyle(
                color: Colors.black45,
            ),),
            onPressed: capturePhotoWithCamera,
          ),
          SimpleDialogOption(
            child: Text("Select from Galary",style: TextStyle(
              color: Colors.black45,
            ),),
            onPressed: photoFRomGalary,
          ),
          SimpleDialogOption(
            child: Text("cancel",style: TextStyle(
              color: Colors.black45,
            ),),
            onPressed:(){
              Navigator.pop(context);
            },
          )
        ],
      );
    }
    );
  }
  capturePhotoWithCamera()async{
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(source: ImageSource.camera,maxHeight: 680,maxWidth: 970);
    setState(() {
      file=imageFile;
    });
  }
  photoFRomGalary()async{
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery,);
    setState(() {
      file=imageFile;
    });
  }
  displayAdminUploadFormScreen(){
return Scaffold(
  appBar: AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.bg2,Colors.grey],
              begin: FractionalOffset(00.00,00.00),
              end: FractionalOffset(01.00,00.00),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp
          )
      ),
    ),
    leading: IconButton(icon: Icon(Icons.arrow_back_sharp,color: Colors.black,),onPressed: clearFormInfo,),
title: Text("New Product",style: TextStyle(
  color: Colors.black,fontWeight: FontWeight.bold
),),
    actions: [
      FlatButton(
        onPressed: uploading ?null:()=>uploadImageAndSaveItemInfo(),
        child: Text("Add",style: TextStyle(
          color: Colors.black,fontWeight: FontWeight.bold
        ),),
      )
    ],
  ),
  body:ListView(
    children: [
      uploading? CircularProgressIndicator(): Text(""),
      Container(
        height: 230,
        width: MediaQuery.of(context).size.width*0.8,
        child: Center(
          child: AspectRatio(
            aspectRatio: 16/9,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(file),fit: BoxFit.cover
                )
            ),


          ),

        ),
      )
      ),
      ListTile(
        leading: Icon(Icons.perm_device_info,color: Colors.black ,),
        title: Container(
          width: 250,
          child: TextField(
            controller: _shortInfoTextEditingController,
            decoration: InputDecoration(
              hintText: "Short Info",
              helperStyle: TextStyle(
                color: Colors.black
              ),
              border: InputBorder.none
            ),
          ),
        ),
      ),
      Divider(color: Colors.black,),
      ListTile(
        leading: Icon(Icons.perm_device_info,color: Colors.black ,),
        title: Container(
          width: 250,
          child: TextField(
            controller: _titleTextEditingController,
            decoration: InputDecoration(
                hintText: "title",
                helperStyle: TextStyle(
                    color: Colors.black
                ),
                border: InputBorder.none
            ),
          ),
        ),
      ),
      Divider(color: Colors.black,),
      ListTile(
        leading: Icon(Icons.perm_device_info,color: Colors.black ,),
        title: Container(
          width: 250,
          child: TextField(
            controller: _descriptionTextEditingController,
            decoration: InputDecoration(
                hintText: "Description",
                helperStyle: TextStyle(
                    color: Colors.black
                ),
                border: InputBorder.none
            ),
          ),
        ),
      ),
      Divider(color: Colors.black,),
      ListTile(
        leading: Icon(Icons.perm_device_info,color: Colors.black ,),
        title: Container(
          width: 250,
          child: TextField(
            keyboardType: TextInputType.number,
            controller: _priceTextEditingController,
            decoration: InputDecoration(
                hintText: "Price",
                helperStyle: TextStyle(
                    color: Colors.black
                ),
                border: InputBorder.none
            ),
          ),
        ),
      ),
      Divider(color: Colors.black,),
    ],
  ) ,
);
  }
  clearFormInfo(){
setState(() {
  file=null;
  _shortInfoTextEditingController.clear();
  _descriptionTextEditingController.clear();
  _titleTextEditingController.clear();
  _priceTextEditingController.clear();
});
  }
  uploadImageAndSaveItemInfo()async{
    setState(() {
      uploading=true;
    });
   String imageDownloadUrl= await uploadItemImage(file);
   saveItemInfo(imageDownloadUrl);
  }
  Future<String> uploadItemImage(mFileImage)async{
    final Reference storageReference =FirebaseStorage.instance.ref().child("Items");
    UploadTask uploadTask = storageReference.child("product_$productId.jpg").putFile(mFileImage);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => uploadTask);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
 saveItemInfo(String downloadUrl){
  final itemsRef = FirebaseFirestore.instance.collection("items");
  itemsRef.doc(productId).set({
    "shortInfo": _shortInfoTextEditingController.text.trim(),
    "longDescription": _descriptionTextEditingController.text.trim(),
    "price": int.parse(_priceTextEditingController.text),
    "publishedDate": DateTime.now(),
    "status": "available",
    "thumbnailUrl":downloadUrl,
    "title": _titleTextEditingController.text.trim(),



  });

  setState(() {
    file=null;
    uploading= false;
    productId=DateTime.now().microsecondsSinceEpoch.toString();
    _titleTextEditingController.text.trim();
    _descriptionTextEditingController.text.trim();
    _priceTextEditingController.text.trim();
    _shortInfoTextEditingController.text.trim();
  });
  }
}
