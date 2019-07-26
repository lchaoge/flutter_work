import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_work/router/router_constant.dart';

class NavigatorUtil {
  static Router router;
  
  /// 公共方法
  static void basePage(BuildContext context,String path, bool replace) {
    NavigatorUtil.router.navigateTo(
      context, 
      path,
      replace: replace, // 清除Splash页面
      transitionBuilder: (_,Animation<double> animation,__,Widget child){
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: Tween<Offset>(
            begin: Offset(-1.0, -1.0),
            end: Offset(1.0, 1.0),
          ).animate(animation),child: child,
          ),
        );
      }
    );
  }

  /// 跳转到主页面
  static void goIndexPage(BuildContext context,bool replace) {
    NavigatorUtil.basePage(context,RouterConstant.indexPage,replace);
  }

  /// 跳转到登录
  static void goLoginPage(BuildContext context,bool replace){
    NavigatorUtil.basePage(context,RouterConstant.loginPage,replace);
  }
}