import 'package:aesthenics/Config/config.dart';
import 'package:aesthenics/pages/Fhome.dart';
import 'package:aesthenics/pages/FinalHome.dart';
import 'package:aesthenics/pages/about.dart';
import 'package:aesthenics/pages/home.dart';
import 'package:aesthenics/pages/introPage.dart';
import 'package:aesthenics/pages/landing_page.dart';
import 'package:aesthenics/pages/pageview.dart';
import 'package:aesthenics/pages/product_list.dart';
import 'package:aesthenics/pages/splashScreen.dart';
import 'package:aesthenics/providers/my_provider.dart';
import 'package:aesthenics/providers/tab_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => my_provider()),
        ChangeNotifierProvider(create: (_) => TabIndex()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            /*textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),*/
           //accentColor: Color(0xFFFF1E00)
          accentColor: Colors.black45
        ),
        home: LandingPage(),
      ),
    );
  }
}

