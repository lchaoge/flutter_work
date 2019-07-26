import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              _errorImage(),
              _errorText(),
              _errorButton(),
            ],
          )),
      ),
    );
  }

  Widget _errorImage() {
    return Container(
      width: ScreenUtil().setWidth(125.0),
      height: ScreenUtil().setHeight(111.0),
      child: Image.network(WMIcons.IMAGE_NO_NET,fit: BoxFit.cover,),
    );
  }

  Widget _errorText(){
    return Container(
      margin: EdgeInsets.only(top: 17.0),
      child: Text(
        '网络不太顺畅哦~',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(WMConstant.PAGE_SIZE),
          color: Colors.grey
        ),
      ),
    );
  }

  Widget _errorButton(){
    return Container(
      margin: EdgeInsets.only(top: 22.0),
      width: ScreenUtil().setWidth(150.0),
      height: ScreenUtil().setHeight(36.0),
      child: RaisedButton(
        onPressed: (){
          print('重新加载试试');
        },
        textColor: Colors.white,
        color: WMColors.themePrimaryColor,
      ),
    );
  }

}
