import 'package:flutter/material.dart';
import 'package:flutter_work/dao/member_dao.dart';
import 'package:flutter_work/model/member_model.dart';
import 'package:flutter_work/widget/member_cell_widget.dart';
import 'package:flutter_work/widget/member_userinfo_widget.dart';
import 'package:flutter_work/provide/device_provide.dart';
import 'package:flutter_work/provide/user_info_provide.dart';
import 'package:flutter_work/provide/member_provide.dart';
import 'package:flutter_work/widget/wmui_loading_widget.dart';
import 'package:flutter_work/widget/wmui_nonetwork_widget.dart';
import 'package:provide/provide.dart';
import 'dart:async';

class MemberPage extends StatelessWidget {

  Future _getAddrDetail(BuildContext context) async {
    
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: FutureBuilder(
          future: _getAddrDetail(context),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              if (snapshot.hasError) {
                return WMuiNonetworkWidget(
                  (){
                    _getAddrDetail(context);
                  },
                ); 
              } else {
                return Container(
                  child: ListView(
                    children: <Widget>[
                      MemberUserinfoWidget(),
                      MemberCellWidget(),
                    ],
                  ),
                );
              }
            }else{
              return WMuiLoadingWidget(
                title: '移动物美',
                fontSize: 40.0,
              );
            }
          },
        )
      ),
    );
  }
}