import 'package:flutter/material.dart';
import 'package:flutter_work/pages/index_page.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '商城',
      theme: ThemeData(
        primaryColor:Color.fromRGBO(54,142,239,1)
      ),
      home: IndexPage(),
    );
  }
}