import 'package:flutter/material.dart';


class App extends StatefulWidget {
  final Widget child;
  App({Key key, this.child}) : super(key: key);
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text('Number of images: $counter'),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              counter++;              
            });
          },
        ),
        appBar: AppBar(
          title: Text("Imagery"),
        ),
      ),
    );
  }
}