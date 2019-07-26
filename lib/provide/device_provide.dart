import 'package:flutter/material.dart';
import 'package:flutter_work/model/device_model.dart';

/**
 * 设备信息状态
 * Created by chaoge
 * on 2019/7/25.
 */
class DeviceProvide with ChangeNotifier {
  DeviceModel deviceModel;

  // 修改手机号和短信验证
  changeMobileAndSmsCode(String mobile, String smsCode) {
    deviceModel.mobile = mobile;
    deviceModel.smsCode = smsCode;
    notifyListeners();
  }

  // 设置手机设备信息
  setDevice(
    String appVerNo,
    String deviceType,
    String retailerNo,
    String deviceBrand,
    String appVerCode,
    String appVerTime,
    String ip,
    String deviceNo,
  ) {
    deviceModel.appVerNo = appVerCode;
    deviceModel.deviceType = deviceType;
    deviceModel.retailerNo = retailerNo;
    deviceModel.deviceBrand = deviceBrand;
    deviceModel.appVerCode = appVerCode;
    deviceModel.appVerTime = appVerTime;
    deviceModel.ip = ip;
    deviceModel.deviceNo = deviceNo;
    notifyListeners();
  }
}
