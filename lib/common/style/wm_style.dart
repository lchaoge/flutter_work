import 'package:flutter/material.dart';

/// 颜色
class WMColors {
  static const String primaryValueString = "#24292E";
  static const String primaryLightValueString = "#42464b";
  static const String primaryDarkValueString = "#121917";
  static const String miWhiteString = "#ececec";
  static const String actionBlueString = "#267aff";
  static const String webDraculaBackgroundColorString = "#282a36";


}

class WMConstant {
  
}

class WMIcons {
  static const String FONT_FAMILY = 'wmIconFont';

  static const String DEFAULT_USER_ICON = 'static/images/logo.png';

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