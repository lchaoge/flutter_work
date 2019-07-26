import 'package:flutter/material.dart';

class MailListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('通讯录'),
        ),
        body: Center(
          child: Text('通讯录'),
        ),
      ),
    );
  }
}