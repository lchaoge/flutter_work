import 'dart:convert';

import 'package:flutter_work/common/utils/url_mapping.dart';
import 'package:flutter_work/common/utils/http_utils.dart';
import 'package:flutter_work/model/device_model.dart';

class UserInfoDao {

  /// 获取验证码
  static Future getSmsCode(String mobile, DeviceModel deviceModel) {
    // var params = {
    //   "mobile": mobile,
    //   "appVerNo": deviceModel.appVerNo,
    //   "deviceType": deviceModel.deviceType,
    //   "retailerNo": deviceModel.retailerNo,
    //   "deviceBrand": deviceModel.deviceBrand,
    //   "appVerCode": deviceModel.appVerCode,
    //   "appVerTime": deviceModel.appVerTime,
    //   "ip": deviceModel.ip,
    //   "deviceNo": deviceModel.deviceNo
    // };
    Map params ={"mobile":"13260094140","appVerNo":"45","deviceType":"2","retailerNo":"wumart","deviceBrand":"Apple#iPhone XS Max","appVerCode":"V3.1.7","appVerTime":"2019-07-17 17:00","ip":"10.111.87.64","deviceNo":"E78A7806-8AB1-46DF-A89F-4C8185AF5488"};
    return HttpUtils.request(UrlMapping.POST_FRAME_V1_GETSMSCODE,method: HttpUtils.POST, data: params);
  }

  /// 获取用户信息
  static Future login(DeviceModel deviceModel){
    return HttpUtils.request(UrlMapping.POST_FRAME_V1_LOGIN,method: HttpUtils.POST, data: deviceModel.toJson());
  }

}
