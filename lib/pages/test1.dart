import 'dart:async';

import 'package:flutter/material.dart';

class Test1 extends StatefulWidget {

  State<StatefulWidget> createState() => _Test1State();

}


class _Test1State extends State<Test1>{

  bool? _loading;
  double? _progressValue;


  @override
  void initState() {
    _loading = false;
    _progressValue = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white38,
        appBar: AppBar(
          title: Text('title test1 '),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
              child: _loading!
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LinearProgressIndicator(value: _progressValue),
                      Text(
                        '${(_progressValue! * 100).round()}%',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  )
                  : Text(
                    'Press button to download',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
         setState(() {
           _loading = !_loading!;
           _updateProgress();
         });
        },
          child: Icon(Icons.download),
        ),
      ),
    );
  }

  void _updateProgress(){
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (timer) {
      setState(() {
        _progressValue = _progressValue! + 0.2;
        if(_progressValue!.toStringAsFixed(1) == '1.0'){
          _loading = false;
          timer.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}

