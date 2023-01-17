import 'package:flutter/material.dart';
import 'package:flutter_test_v2/pages/home.dart';
import 'package:flutter_test_v2/pages/home_fb_db.dart';
import 'package:flutter_test_v2/pages/main_screen.dart';



void main() =>runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.amber, // not work
  ),
  initialRoute: '/',
  routes: {
    '/' : (context) =>  MainScreen(),
    '/todo' : (context) =>  Home(),
    '/tododb' : (context) =>  HomeFBDB()
  },
));