/**
 * 设备信息
 * Created by chaoge
 * on 2019/7/25.
 */
class DeviceModel {
  String mobile; /// 手机号
  String appVerNo; /// 发版编号
  String deviceType; /// 设备类型 1=IOS，2=Andriod
  String retailerNo; /// 供商
  String smsCode; /// 验证码
  String deviceBrand; /// 设备品牌
  String appVerCode; /// app版本
  String appVerTime; /// 发版时间
  String ip; /// Ip
  String deviceNo; /// 设备编号

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