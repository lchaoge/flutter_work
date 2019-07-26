/**
 * 设备信息
 * Created by chaoge
 * on 2019/7/25.
 */
class DeviceModel {
  String mobile;
  String appVerNo;
  String deviceType;
  String retailerNo;
  String smsCode;
  String deviceBrand;
  String appVerCode;
  String appVerTime;
  String ip;
  String deviceNo;

  DeviceModel(
      {this.mobile,
      this.appVerNo,
      this.deviceType,
      this.retailerNo,
      this.smsCode,
      this.deviceBrand,
      this.appVerCode,
      this.appVerTime,
      this.ip,
      this.deviceNo});

  DeviceModel.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    appVerNo = json['appVerNo'];
    deviceType = json['deviceType'];
    retailerNo = json['retailerNo'];
    smsCode = json['smsCode'];
    deviceBrand = json['deviceBrand'];
    appVerCode = json['appVerCode'];
    appVerTime = json['appVerTime'];
    ip = json['ip'];
    deviceNo = json['deviceNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['appVerNo'] = this.appVerNo;
    data['deviceType'] = this.deviceType;
    data['retailerNo'] = this.retailerNo;
    data['smsCode'] = this.smsCode;
    data['deviceBrand'] = this.deviceBrand;
    data['appVerCode'] = this.appVerCode;
    data['appVerTime'] = this.appVerTime;
    data['ip'] = this.ip;
    data['deviceNo'] = this.deviceNo;
    return data;
  }
}