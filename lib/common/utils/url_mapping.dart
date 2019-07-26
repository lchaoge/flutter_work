import 'package:flutter_work/common/config/config.dart';


const String mapp = Config.DEBUG ? 'http://10.101.200.82:8451' : 'http://mapp.wumart.com';

class UrlMapping {
  static String POST_FRAME_V1_GETSMSCODE = mapp + '/api/frame/v1/getSmsCode';
  static String POST_FRAME_V1_LOGIN = mapp + '/api/frame/v1/login';
}