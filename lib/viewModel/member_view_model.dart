import 'package:flutter/material.dart';
import 'package:flutter_work/dao/member_dao.dart';
import 'package:flutter_work/model/member_model.dart';
import 'package:provide/provide.dart';
import 'package:flutter_work/provide/member_provide.dart';
import 'package:flutter_work/provide/device_provide.dart';
import 'package:flutter_work/provide/user_info_provide.dart';

class MemberViewModel {
  static Future getAddrDetail(BuildContext context) async {
    
    Map params = {
      "deviceBrand": Provide.value<DeviceProvide>(context).deviceModel.deviceBrand,
      "userNo": Provide.value<UserInfoProvide>(context).userInfoModel.data.userInfo.userNo,
      "retailerNo": Provide.value<DeviceProvide>(context).deviceModel.retailerNo,
    };
    await MemberDao.selectAddrDetail(params).then((res){
      if(res!=null){
        MemberModel memberModel = MemberModel.fromJson(res);
        if(memberModel.code == '0000'){
          Provide.value<MemberProvide>(context).setMember(memberModel);
        }
      }
    });
    return '加载完成';
  }
}