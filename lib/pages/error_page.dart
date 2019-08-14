import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/router/navigator_util.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _errorImage(),
              _errorText(),
              _errorButton(context),
            ],
          )),
      ),
    );
  }

  Widget _errorImage() {
    return Container(
      width: ScreenUtil().setWidth(125.0),
      height: ScreenUtil().setHeight(111.0),
      child: Image.asset(WMIcons.IMAGE_NO_NET,fit: BoxFit.cover,),
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

  Widget _errorButton(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 22.0),
      width: ScreenUtil().setWidth(150.0),
      height: ScreenUtil().setHeight(36.0),
      child: RaisedButton(
        child: Text('重新加载试试'),
        onPressed: (){
          NavigatorUtil.goIndexPage(context, true);
        },
        textColor: Colors.white,
        color: WMColors.themePrimaryColor,
      ),
    );
  }

}
