import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_work/pages/error_page.dart';
import 'package:flutter_work/pages/index_page.dart';
import 'package:flutter_work/pages/login_page.dart';
import 'package:flutter_work/pages/splash_page.dart';


Handler errorPageHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    // String goodsId = params['id'].first;
    // print('index>details goodsId is $goodsId');
    return ErrorPage();
  }
);

Handler splashPageHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return SplashPage();
  }
);

Handler indexPageHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return IndexPage();
  }
);

Handler loginPageHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    // String goodsId = params['id'].first;
    // print('index>details goodsId is $goodsId');
    return LoginPage();
  }
);