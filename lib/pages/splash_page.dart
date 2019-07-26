import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_work/router/navigator_util.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/common/utils/utils.dart';
import 'package:flutter_work/provide/user_info_provide.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _t;

  @override
  void initState() {
    super.initState();
    _t = new Timer(const Duration(milliseconds: 3000), () {
      try {
        bool isLogin = Provide.value<UserInfoProvide>(context).isLogin;
        if(isLogin){
          NavigatorUtil.goIndexPage(context,true);
        }else{
          NavigatorUtil.goLoginPage(context,true);
        }
      } catch (e) {
        Utils.toast('跳转首页失败');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _t.cancel();
  }

  @override
  Widget build(BuildContext context) {
    //设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false
    ScreenUtil.instance = ScreenUtil(width: 375,height: 667)..init(context);
    
    print('设备像素密度:${ScreenUtil.pixelRatio}');
    print('设备的高:${ScreenUtil.screenHeight}');
    print('设备的宽:${ScreenUtil.screenWidth}');
    return Material(
      color: WMColors.primaryColor,
      child: Padding(
        padding: EdgeInsets.only(top: 150.0),
        child: Column(
          children: <Widget>[
            _title(),
            _subTitle(),
            _decs(),
          ],
        ),
      ),
    );
  }
  
  Widget _title(){
    return Container(
      child: Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.yellow,
        child: Text(
          '全面数字化',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(30.0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _subTitle(){
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Text(
        '新一代工作模式',
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil().setSp(30.0),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _decs(){
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: Text(
        'A New Generation of Work Mode',
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil().setSp(14.0),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}
