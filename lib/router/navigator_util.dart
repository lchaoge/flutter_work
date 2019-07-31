import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_work/router/router_constant.dart';

class NavigatorUtil {
  static Router router;

  /// 公共方法
  static void basePage(BuildContext context, String path, bool replace,
      {TransitionType transition = TransitionType.cupertino}) {
    NavigatorUtil.router.navigateTo(
      context,
      path,
      replace: replace, // 清除Splash页面
      transition: transition, // 转场动画
    );
  }

  /// 跳转到主页面
  static void goIndexPage(BuildContext context, bool replace) {
    NavigatorUtil.basePage(context, RouterConstant.indexPage, replace,
        transition: TransitionType.inFromBottom);
  }

  /// 跳转到登录
  static void goLoginPage(BuildContext context, bool replace) {
    NavigatorUtil.basePage(context, RouterConstant.loginPage, replace,
        transition: TransitionType.inFromBottom);
  }

  /// 跳转到我的二维码
  static void goMemberQRCodePage(BuildContext context, bool replace) {
    NavigatorUtil.basePage(context, RouterConstant.memberQRCodePage, replace);
  }

  /// 跳转到我的二维码
  static void goMemberSharePage(BuildContext context, bool replace) {
    NavigatorUtil.basePage(context, RouterConstant.memberSharePage, replace);
  }
}
