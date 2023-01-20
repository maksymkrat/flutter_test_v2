

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Test2 extends StatefulWidget {
  State<StatefulWidget> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white38,
        appBar: AppBar(
          title: Text('adding assets'),
          centerTitle: true,
        ),
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(image: AssetImage('assets/images/img.png'),
              ),
              SvgPicture.asset('assets/icons/icon_VR.svg',color: Colors.red,semanticsLabel: 'btr',)
            ],
          ),
        ),
      ),
    );
  }
}
