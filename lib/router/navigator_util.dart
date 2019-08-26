import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_work/model/home_menu_model.dart';
import 'package:flutter_work/router/router_constant.dart';
import 'package:provide/provide.dart';
import 'package:flutter_work/provide/user_info_provide.dart';
import 'package:flutter_work/provide/member_provide.dart';

class NavigatorUtil {
  static Router router;

  /// 公共方法
  static void basePage(BuildContext context, String path, bool replace,
      {TransitionType transition = TransitionType.cupertino}) async {
    await NavigatorUtil.router.navigateTo(
      context,
      path,
      replace: replace, // 清除Splash页面
      transition: transition, // 转场动画
    );
  }

  /// 错误页
  static void goErrorPage(BuildContext context, bool replace) {
    basePage(context, RouterConstant.errorPage, replace,
        transition: TransitionType.inFromBottom);
  }

  /// 跳转到登录
  static void goLoginPage(BuildContext context, bool replace) {
    basePage(context, RouterConstant.loginPage, replace,
        transition: TransitionType.inFromBottom);
  }

  /// 扫码
  static void goScanPage(BuildContext context, bool replace) {
    basePage(context, RouterConstant.scanPage, replace);
  }

  /// webview
  static void goWebViewPage(BuildContext context, bool replace, Map params) {
    if(params['isSiteUse'] == 1){
      // Provide.value<UserInfoProvide>(context).userInfoModel.data.;
      // Provide.value<MemberProvide>(context).memberModel;
      params['url'] = params['url'].replaceAll('{siteNo}', '1163').replaceAll('{siteName}', '惠新店');
    }
    if(params['title'] !=null){
      params['title'] = Uri.encodeComponent('${params['title']}');
    }
    if(params["url"]!=null){
      params["url"] = Uri.encodeComponent('${params["url"]}');
    }
    if(params["isAppTitle"]!=null){
      params["isAppTitle"] = Uri.encodeComponent('${params["isAppTitle"]}');
    }
    
    String url = RouterConstant.webviewPage + '?title=${params["title"]}&url=${params["url"]}&isAppTitle=${params["isAppTitle"]}';
    basePage(context, url, replace);
  }

  /// 跳转到主页面
  static void goIndexPage(BuildContext context, bool replace) {
    basePage(context, RouterConstant.indexPage, replace,
        transition: TransitionType.inFromBottom);
  }

  /// 跳转到通讯录
  static void goMailListPage(BuildContext context, bool replace, Map params) {
    String url = RouterConstant.mailListPage + '?orgCode=' + params['orgCode'];

    basePage(context, url, replace, transition: TransitionType.inFromBottom);
  }

  /// 跳转到我的二维码
  static void goMemberQRCodePage(BuildContext context, bool replace) {
    basePage(context, RouterConstant.memberQRCodePage, replace);
  }

  /// 跳转到分享APP
  static void goMemberSharePage(BuildContext context, bool replace) {
    basePage(context, RouterConstant.memberSharePage, replace);
  }
}
