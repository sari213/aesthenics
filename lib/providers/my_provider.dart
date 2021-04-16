import 'package:aesthenics/models/categories_model.dart';
import 'package:aesthenics/models/categories_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class my_provider extends ChangeNotifier{
  List<categories_model> productList=[];
  categories_model categoriesModel;
  Future<void>getProducts()async{
    FirebaseFirestore.instance.collection("Products");

  }


  }


