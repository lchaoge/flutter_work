import 'package:flutter/material.dart';
import 'package:flutter_work/model/device_model.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';
import 'package:wifi/wifi.dart';

/*
 * 设备信息状态
 * Created by chaoge
 * on 2019/7/25.
 */
class DeviceProvide with ChangeNotifier {
  DeviceModel deviceModel = new DeviceModel();

  /// 修改手机号和短信验证
  setMobileAndSmsCode({String mobile, String smsCode}) {
    deviceModel.mobile = mobile;
    deviceModel.smsCode = smsCode;
    notifyListeners();
  }

  /// 设置手机设备信息
  setDevice() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if(Platform.isIOS){
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceModel.appVerNo = '45';
      deviceModel.deviceType = '1';
      deviceModel.retailerNo = 'wumart';
      deviceModel.deviceBrand = 'ios#${iosInfo.model}';
      deviceModel.appVerCode = 'V3.1.6';
      deviceModel.appVerTime = '2019-06-27 15:30';
      deviceModel.ip = await Wifi.ip;
      deviceModel.deviceNo = iosInfo.identifierForVendor;
    }else if(Platform.isAndroid){
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceModel.appVerNo = '45';
      deviceModel.deviceType = '2';
      deviceModel.retailerNo = 'wumart';
      deviceModel.deviceBrand = 'android#${androidInfo.brand}';
      deviceModel.appVerCode = 'V3.1.6';
      deviceModel.appVerTime = '2019-06-27 15:30';
      deviceModel.ip = await Wifi.ip;
      deviceModel.deviceNo = androidInfo.host;
    }
    notifyListeners();
  }
}
