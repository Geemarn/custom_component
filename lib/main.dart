import 'package:flutter/material.dart';
import 'components/custom_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'custom widget',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.lightBlueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom widgets'),
        ),
        body: Center(
          child: CustomButton(
            backIcon: Icon(Icons.arrow_forward),
            frontIcon: Icon(Icons.favorite),
            color: Colors.blueAccent,
            text: 'Continue',
            onPressed: () {
              print("tapped something");
            },
          ),
        ),
      ),
    );
  }
}
