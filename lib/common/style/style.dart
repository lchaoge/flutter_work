import 'package:flutter/material.dart';

/// 颜色
class WMColors {
  static const Color themePrimaryColor = Color(0xFF559EF7);
  static const Color themeBackground = Color(0xFFF8F8F8);
  static const Color themeBlackColor = Color(0xFF000000);
  static const Color themeWhiteColor = Color(0xFFffffff);
  static const Color themeDefaultColor = Color(0xFF666666);
  static const Color themeWarningColor = Color(0xFFF4B34A);
  static const Color themeInfoColor = Color(0xFF0089C7);
  static const Color themeSuccessColor = Color(0xFF67C23A);
  static const Color themeDangerColor = Color(0xFFF87356);
  static const Color themeBorderColor = Color(0xFFd7d7d7);
  static const Color themeRedColor = Color(0xFFFF4240);

}

class WMConstant {
  static const double PAGE_SIZE = 14.0;
  
}

class WMIcons {
  static const String FONT_FAMILY = 'wmIconFont';
  static const String IMAGE_URL = 'http://upyun-img.wumart.com';

  static const String IMAGE_LOGO = IMAGE_URL+'/wmhelper/common/img/logo.png';
  static const String IMAGE_LOGO2 = IMAGE_URL+'/wmhelper/common/img/logo.png';
  static const String IMAGE_LOADING = 'static/images/loading.gif';
  static const String IMAGE_NO_NET = 'static/images/no_net.png';

  static const IconData WORK = const IconData(0xe636, fontFamily: WMIcons.FONT_FAMILY); // 工作台
  static const IconData WORK_SELECTED = const IconData(0xe637, fontFamily: WMIcons.FONT_FAMILY); // 工作台
  static const IconData PROXY = const IconData(0xe639, fontFamily: WMIcons.FONT_FAMILY); // 待办
  static const IconData PROXY_SELECTED = const IconData(0xe63a, fontFamily: WMIcons.FONT_FAMILY); // 待办
  static const IconData MAILLIST = const IconData(0xe63c, fontFamily: WMIcons.FONT_FAMILY); // 通讯录
  static const IconData MAILLIST_SELECTED = const IconData(0xe63d, fontFamily: WMIcons.FONT_FAMILY); // 通讯录
  static const IconData USER = const IconData(0xe619, fontFamily: WMIcons.FONT_FAMILY); // 我的
  static const IconData USER_SELECTED = const IconData(0xe63f, fontFamily: WMIcons.FONT_FAMILY); // 我的

  static const IconData SCAN = const IconData(0xe624, fontFamily: WMIcons.FONT_FAMILY); // 扫一扫
  static const IconData NEWS = const IconData(0xe60d, fontFamily: WMIcons.FONT_FAMILY); // 消息

  //待办
  static const IconData STATISTICS = const IconData(0xe646, fontFamily: WMIcons.FONT_FAMILY); // 统计
  

}