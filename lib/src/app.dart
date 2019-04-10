import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:async';
import 'dart:convert';
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  //final Widget child;
  //App({Key key, this.child}) : super(key: key);
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    print("Tyring to fetch image...");
    final response = await get('https://api.unsplash.com/photos/random?client_id=5d4e6528031d85ab5c4217cafebfc002f776f9137d47d43c91b5a8ea1b8e81f7');
    print("finished fetching image");
    try {
      var imageModel = ImageModel.fromJson(json.decode(response.body));
      setState(() {
        counter++;
        images.add(imageModel);
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          title: Text("Imagery"),
        ),
      ),
    );
  }
}
