import 'package:flutter_work/common/config/config.dart';


const String mapp = Config.DEBUG ? 'http://10.101.200.82:8451' : 'http://mapp.wumart.com';

class UrlMapping {
  /// 版本
  static String POST_FRAME_V1_CHECKVERSION = mapp + '/api/frame/v1/checkVersion';
  /// 获取验证码
  static String POST_FRAME_V1_GETSMSCODE = mapp + '/api/frame/v1/getSmsCode';
  /// 登录
  static String POST_FRAME_V1_LOGIN = mapp + '/api/frame/v1/login';
  /// 首页-获取菜单
  static String POST_COMM_V1_MAIN = mapp + '/api/comm/v1/main';
  /// 首页-banner
  static String POST_FRAME_V1_GETBANNERIMGLIST = mapp + '/api/frame/v1/getBannerImgList';
  /// 获取通讯录
  static String POST_HRS_V1_SEARCHADDRORGLIST = mapp + '/api/hrs/v1/searchAddrOrgList';
  /// 我的
  static String POST_HRS_V1_GETADDRDETAIL = mapp + '/api/hrs/v1/getAddrDetail';
}