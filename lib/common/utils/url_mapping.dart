import 'package:flutter_work/common/config/config.dart';


const String mappURL = Config.DEBUG ? 'http://10.101.200.82:8451' : 'http://mapp.wumart.com';
const String proxyURL = Config.DEBUG ? 'http://mworkweb.wumart.com/wmWorkegn' : 'http://workegn.wumart.com';



class UrlMapping {
  /// 版本
  static const String POST_FRAME_V1_CHECKVERSION = mappURL + '/api/frame/v1/checkVersion';
  /// 获取验证码
  static const String POST_FRAME_V1_GETSMSCODE = mappURL + '/api/frame/v1/getSmsCode';
  /// 登录
  static const String POST_FRAME_V1_LOGIN = mappURL + '/api/frame/v1/login';
  /// 首页-获取菜单
  static const String POST_COMM_V1_MAIN = mappURL + '/api/comm/v1/main';
  /// 首页-banner
  static const String POST_FRAME_V1_GETBANNERIMGLIST = mappURL + '/api/frame/v1/getBannerImgList';
  /// 首页-业绩
  static const String POST_FRAME_V1_GETMYRTSALE = mappURL + '/api/reports/v1/getMyRtSale';
  /// 首页-天气
  static const String POST_HOME_WEATHER = 'https://www.tianqiapi.com/api/?version=v1';
  /// 获取通讯录
  static const String POST_HRS_V1_SEARCHADDRORGLIST = mappURL + '/api/hrs/v1/searchAddrOrgList';
  /// 我的
  static const String POST_HRS_V1_GETADDRDETAIL = mappURL + '/api/hrs/v1/getAddrDetail';

  /// 任务首页
  static const String POST_proxy_TASK_CATELIST = proxyURL + '/task/catelist';
  
}