import  'package:flutter/material.dart';
import 'package:flutter_test_v2/pages/home.dart';
import 'package:flutter_test_v2/pages/home_fb_db.dart';
import 'package:flutter_test_v2/pages/main_screen.dart';
import 'package:flutter_test_v2/pages/test1.dart';
import 'package:flutter_test_v2/pages/test2.dart';



void main() =>runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.amber, // not work
  ),
  initialRoute: '/',
  routes: {
    '/' : (context) =>  MainScreen(),
    '/todo' : (context) =>  Home(),
    '/tododb' : (context) =>  HomeFBDB(),
    '/loader' : (context) =>  Test1(),
    '/img' : (context) =>  Test2()
  },
));