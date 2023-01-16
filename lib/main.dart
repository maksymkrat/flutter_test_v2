import 'package:flutter/material.dart';
import 'package:flutter_test_v2/pages/home.dart';


void main() =>runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.amber, // not work
  ),
  home: Home(),
));