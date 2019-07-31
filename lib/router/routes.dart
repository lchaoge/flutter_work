import 'package:fluro/fluro.dart';
import 'package:flutter_work/router/router_handler.dart';
import 'package:flutter_work/router/router_constant.dart';


class Routes {

  static void configureRoutes(Router router) {
    // 找不到页面
    router.notFoundHandler = errorPageHandler;
    // 过渡页面
    router.define(RouterConstant.root, handler: splashPageHandler);
    // 首页
    router.define(RouterConstant.indexPage, handler: indexPageHandler);
    // 登录
    router.define(RouterConstant.loginPage, handler: loginPageHandler);
    // 我的二维码
    router.define(RouterConstant.memberQRCodePage, handler: memberQRCodePageHandler);
    // 分享二维码
    router.define(RouterConstant.memberSharePage, handler: memberSharePageHandler);
    
  }
}
