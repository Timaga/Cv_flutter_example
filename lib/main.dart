import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/screens/layout_screen.dart';
// import 'package:rock_paper_scissors/screens/test.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:MyExpandableText(),
    );
  }
}