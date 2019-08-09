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
  static const String IMAGE_LOGO2 = IMAGE_URL+'/wmhelper/common/img/logo2.png';
  static const String IMAGE_LOADING = 'static/images/loading.gif';
  static const String IMAGE_NO_NET = 'static/images/no_net.png';
  static const String IMAGE_NO_DATA = 'static/images/no_data.png';
  static const String IMAGE_DEFAULT_USER = 'static/images/default_user.png';
  static const String IMAGE_LISHI = 'static/images/lishi.png';
  static const String IMAGE_TECHREPORT = 'static/images/techreport.png';

  static const String IMAGE_HOME_WORK = 'static/images/home_work.png'; // 工作台
  static const String IMAGE_HOME_WORK_SELECTED = 'static/images/home_work_selected.png'; // 工作台
  static const String IMAGE_HOME_PROXY = 'static/images/home_proxy.png'; // 待办
  static const String IMAGE_HOME_PROXY_SELECTED = 'static/images/home_proxy_selected.png'; // 待办
  static const String IMAGE_HOME_MAILLIST = 'static/images/home_mail_list.png'; // 通讯录
  static const String IMAGE_HOME_MAILLIST_SELECTED = 'static/images/home_mail_list_selected.png'; // 通讯录
  static const String IMAGE_HOME_USER = 'static/images/home_user.png'; // 我的
  static const String IMAGE_HOME_USER_SELECTED = 'static/images/home_user_selected.png'; // 我的

  static const IconData ICON_HOME_SCAN = const IconData(0xe624, fontFamily: WMIcons.FONT_FAMILY); // 扫一扫
  static const IconData ICON_HOME_NEWS = const IconData(0xe60d, fontFamily: WMIcons.FONT_FAMILY); // 消息
  static const IconData ICON_HOME_MAILLIST = const IconData(0xe62d, fontFamily: WMIcons.FONT_FAMILY); // 通讯录


  //待办
  static const IconData STATISTICS = const IconData(0xe646, fontFamily: WMIcons.FONT_FAMILY); // 统计
  

}