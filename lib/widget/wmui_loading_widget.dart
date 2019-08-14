import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class WMuiLoadingWidget extends StatelessWidget {

  final String title;
  final double fontSize;
  WMuiLoadingWidget({this.title = '移动物美',this.fontSize = 40.0});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200],
        highlightColor: Colors.white,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey[200],
            fontSize: ScreenUtil().setSp(fontSize),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
