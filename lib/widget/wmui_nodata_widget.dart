import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';

class WMuiNoDataWidget extends StatelessWidget {
  final String image;
  final String text;
  WMuiNoDataWidget(this.text, {this.image = WMIcons.IMAGE_NO_DATA});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _imageUI(),
            _textUI(),
          ],
        ),
      ),
    );
  }

  // 图片
  Widget _imageUI() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(125.0),
      height: ScreenUtil().setHeight(111.0),
      child: Image.asset(image, fit: BoxFit.cover),
    );
  }

  // 描述
  Widget _textUI() {
    return Container(
      margin: EdgeInsets.only(top: 17.0),
      alignment: Alignment.center,
      child: Text(
        text != null ? text : '网络不太顺畅哦～',
        style: TextStyle(
          color: Color.fromRGBO(153, 153, 153, 1.0),
          fontSize: ScreenUtil().setSp(14.0),
        ),
      ),
    );
  }
}
