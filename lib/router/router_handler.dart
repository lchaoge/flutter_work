import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_work/pages/error_page.dart';
import 'package:flutter_work/pages/index_page.dart';
import 'package:flutter_work/pages/login_page.dart';
import 'package:flutter_work/pages/mail_list_page.dart';
import 'package:flutter_work/pages/member_qr_code_page.dart';
import 'package:flutter_work/pages/member_share_page.dart';
import 'package:flutter_work/pages/scan_page.dart';
import 'package:flutter_work/pages/splash_page.dart';
import 'package:flutter_work/pages/webview_page.dart';



Handler errorPageHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return ErrorPage();
  }
);

Handler scanPageHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return ScanPage();
  }
);

Handler webviewPageHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String title = params['title'].first;
    String url = params['url'].first;
    String isAppTitle = params['isAppTitle'].first;
    return WebviewPage(url,title:title,isAppTitle:isAppTitle);
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

Handler memberQRCodePageHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    // String goodsId = params['id'].first;
    // print('index>details goodsId is $goodsId');
    return MemberQRCodePage();
  }
);
Handler memberSharePageHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    // String goodsId = params['id'].first;
    // print('index>details goodsId is $goodsId');
    return MemberSharePage();
  }
);
Handler mailListPageHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String orgCode = params['orgCode'].first;
    return MailListPage(orgCode:orgCode);
  }
);
