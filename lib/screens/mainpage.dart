import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  static const String id = "mainpage";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Page')),
      body: Center(
        child: MaterialButton(
          onPressed: () {},
          color: Colors.blue,
          minWidth: 200,
          child: Text("Hello"),
        ),
      ),
    );
  }
}
