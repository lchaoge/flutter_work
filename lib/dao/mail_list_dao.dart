import 'package:flutter/material.dart';
import 'package:flutter_work/common/utils/http_utils.dart';
import 'package:flutter_work/common/utils/url_mapping.dart';
import 'package:flutter_work/model/device_model.dart';
import 'package:provide/provide.dart';
import 'package:flutter_work/provide/device_provide.dart';
import 'package:flutter_work/provide/user_info_provide.dart';
import 'package:flutter_work/model/user_info_model.dart';

class MailListDao {
  /// 查询通讯录
  static Future selectSearchAddrOrgList(BuildContext context, String orgCode) {
    DeviceModel deviceModel = Provide.value<DeviceProvide>(context).deviceModel;
    UserInfo userInfo = Provide.value<UserInfoProvide>(context).userInfoModel.data.userInfo;
    Map params = {
      "orgCode": orgCode,
      "appVerNo": deviceModel.appVerNo,
      "deviceType": deviceModel.deviceType,
      "clientNo": userInfo.mandt,
      "retailerNo": deviceModel.retailerNo,
      "deviceBrand": deviceModel.deviceBrand,
      "appVerCode": deviceModel.appVerCode,
      "appVerTime": deviceModel.appVerTime,
      "deviceNo": deviceModel.deviceNo
    };
    return HttpUtils.request(UrlMapping.POST_HRS_V1_SEARCHADDRORGLIST,
        method: HttpUtils.POST, data: params);
  }
}
