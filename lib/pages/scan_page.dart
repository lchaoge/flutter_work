import 'package:flutter/material.dart';
import 'package:flutter_skeleton/flutter_skeleton.dart';
import 'package:pk_skeleton/pk_skeleton.dart';

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('扫一扫'),
        ),
        body: PKCardPageSkeleton(
          totalLines: 5,
        ),
        
      ),
    );
  }
}