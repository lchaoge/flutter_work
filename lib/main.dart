import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/router/router_constant.dart';
import 'package:flutter_work/router/routes.dart';
import 'package:flutter_work/router/navigator_util.dart';
import 'package:provide/provide.dart';
import 'package:flutter_work/provide/current_index_provide.dart';
import 'package:flutter_work/provide/device_provide.dart';
import 'package:flutter_work/provide/user_info_provide.dart';
import 'package:flutter_work/pages/splash_page.dart';

void main(){
  var providers = Providers();
  providers
  ..provide(Provider<CurrentIndexProvide>.value(CurrentIndexProvide()))
  ..provide(Provider<DeviceProvide>.value(DeviceProvide()))
  ..provide(Provider<UserInfoProvide>.value(UserInfoProvide()));

  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    NavigatorUtil.router = router;

    return Container(
      child: MaterialApp(
        title: '京东商城',
        onGenerateRoute: NavigatorUtil.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          platform: TargetPlatform.iOS, // 滑动返回
          primaryColor: WMColors.primaryColor,
        ),
        initialRoute: RouterConstant.root,
        // home: SplashPage(),
      ),
    );
  }
}
