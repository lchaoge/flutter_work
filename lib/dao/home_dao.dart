import 'package:flutter/material.dart';
import 'package:flutter_work/common/utils/http_utils.dart';
import 'package:flutter_work/common/utils/url_mapping.dart';
import 'package:flutter_work/model/device_model.dart';
import 'package:flutter_work/model/user_info_model.dart';
import 'package:provide/provide.dart';
import 'package:flutter_work/provide/device_provide.dart';
import 'package:flutter_work/provide/user_info_provide.dart';

class HomeDao {
  /// 获取首页菜单
  static Future getHomeMenu(BuildContext context){
    UserInfo userInfo = Provide.value<UserInfoProvide>(context).userInfoModel.data.userInfo;
    DeviceModel deviceModel = Provide.value<DeviceProvide>(context).deviceModel;
    Map params = {
      "userNo": userInfo.userNo,
      "mobile": userInfo.userMobile,
      "userName": userInfo.userName,
      "appVerNo": deviceModel.appVerNo,
      "deviceType": deviceModel.deviceType,
      "retailerNo": deviceModel.retailerNo,
      "deviceBrand": deviceModel.deviceBrand,
      "appVerCode": deviceModel.appVerCode,
      "appVerTime": deviceModel.appVerTime,
      "ip": deviceModel.ip,
      "deviceNo": deviceModel.deviceNo
    };
    return HttpUtils.request(UrlMapping.POST_COMM_V1_MAIN,method: HttpUtils.POST, data: params);
  }

  /// 获取首页banner
  static Future getBanner(BuildContext context){
    UserInfo userInfo = Provide.value<UserInfoProvide>(context).userInfoModel.data.userInfo;
    DeviceModel deviceModel = Provide.value<DeviceProvide>(context).deviceModel;
    Map params = {
      "userNo": userInfo.userNo,
      "mobile": userInfo.userMobile,
      "userName": userInfo.userName,
      "appVerNo": deviceModel.appVerNo,
      "deviceType": deviceModel.deviceType,
      "retailerNo": deviceModel.retailerNo,
      "deviceBrand": deviceModel.deviceBrand,
      "appVerCode": deviceModel.appVerCode,
      "appVerTime": deviceModel.appVerTime,
      "ip": deviceModel.ip,
      "deviceNo": deviceModel.deviceNo
    };
    return HttpUtils.request(UrlMapping.POST_FRAME_V1_GETBANNERIMGLIST,method: HttpUtils.POST, data: params);
  }
}