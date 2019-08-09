import 'dart:convert';

import 'package:flutter_work/common/utils/url_mapping.dart';
import 'package:flutter_work/common/utils/http_utils.dart';
import 'package:flutter_work/model/device_model.dart';

class UserInfoDao {

  /// 获取验证码
  static Future selectSmsCode(String mobile, DeviceModel deviceModel) {
    Map params = {
      "mobile": mobile,
      "appVerNo": deviceModel.appVerNo,
      "deviceType": deviceModel.deviceType,
      "retailerNo": deviceModel.retailerNo,
      "deviceBrand": deviceModel.deviceBrand,
      "appVerCode": deviceModel.appVerCode,
      "appVerTime": deviceModel.appVerTime,
      "ip": deviceModel.ip,
      "deviceNo": deviceModel.deviceNo
    };
    return HttpUtils.request(UrlMapping.POST_FRAME_V1_GETSMSCODE,method: HttpUtils.POST, data: params);
  }

  /// 获取用户信息
  static Future login(DeviceModel deviceModel){
    return HttpUtils.request(UrlMapping.POST_FRAME_V1_LOGIN,method: HttpUtils.POST, data: deviceModel.toJson());
  }

}
