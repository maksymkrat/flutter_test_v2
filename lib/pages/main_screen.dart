import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text("to do list"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: [
            Text(
              'Main screen',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/todo');
                  //Navigator.pushNamedAndRemoveUntil(context, '/todo', (route) => false);
                  //Navigator.pushReplacementNamed(context, '/todo');
                },
                child: Text('move on')),

            Padding(padding: EdgeInsets.only(left: 15)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/loader');
                },
                child: Text('loader')),

            Padding(padding: EdgeInsets.only(left: 15)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/img');
                },
                child: Text('img')),
          ],
        ));
  }
}
