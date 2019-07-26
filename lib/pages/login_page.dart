import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/dao/user_info_dao.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/common/utils/public_utils.dart';
import 'package:flutter_work/model/device_model.dart';
import 'package:flutter_work/model/user_info_model.dart';
import 'package:flutter_work/router/navigator_util.dart';
import 'package:provide/provide.dart';
import 'package:flutter_work/provide/device_provide.dart';
import 'package:flutter_work/provide/user_info_provide.dart';

/**
 * 登录
 */
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 100.0,
          left: 20.0,
          right: 20.0,
        ),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // final registerFormKey = GlobalKey<FormState>();

  String mobile, smsCode;
  bool autovalidate = false;

  void getSmsCode(){
    DeviceModel deviceModel = Provide.value<DeviceProvide>(context).deviceModel;
    UserInfoDao.getSmsCode(mobile, deviceModel).then((res){
      if(res['code'] == '0000'){
        if(res['data']!=null){
          setState(() {
            smsCode = res['data']['smsCode']; 
          });
        }
      }else{
        PublicUtils.toast(res['msg']);
      }
    });
  }

  void login(){
    Provide.value<DeviceProvide>(context).setMobileAndSmsCode(
      mobile: mobile,
      smsCode: smsCode
    );
    DeviceModel deviceModel = Provide.value<DeviceProvide>(context).deviceModel;
    UserInfoDao.login(deviceModel).then((res){
      var jsonString = json.decode(res.toString());
      UserInfoModel userInfoModel = UserInfoModel.fromJson(jsonString);
      if(userInfoModel.code == '0000'){
        if(userInfoModel.data!=null){
          Provide.value<UserInfoProvide>(context).setUserInfo(userInfoModel);
          Provide.value<UserInfoProvide>(context).setLoginState(true);
          NavigatorUtil.goIndexPage(context, true);
        }else{
          Provide.value<UserInfoProvide>(context).setLoginState(true);
        }
      }else{
        PublicUtils.toast(userInfoModel.msg);
      }
      
    });
  }

  String _validateUsername(value) {
    if (value.isEmpty) {
      return '请输入手机号';
    }
    return null;
  }

  String _validatePassword(value) {
    if (value.isEmpty) {
      return '请输入验证码';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _logoUI(),
          _phoneInputUI(),
          _smsCodeBoxUI(),
          _loginButtonUI(),
        ],
      ),
    );
  }

  /// logo
  Widget _logoUI() {
    return Container(
      width: ScreenUtil().setWidth(117.0),
      height: ScreenUtil().setHeight(110.0),
      child: Image.network(
        WMIcons.IMAGE_LOGO2,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  /// 手机号
  Widget _phoneInputUI() {
    return Container(
      height: ScreenUtil().setHeight(45),
      margin: EdgeInsets.only(top: 50.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(gapPadding: 0.0),
          fillColor: WMColors.themeBackground,
          prefixText: '+86 ',
          icon: Text(
            '手机号',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(14.0),
            ),
          ),
          suffixStyle: TextStyle(
            color: WMColors.themeBorderColor,
          ),
        ),
        keyboardType: TextInputType.phone,
        autocorrect: true,
        textInputAction: TextInputAction.none,
        onChanged:(String value){
          setState(() {
            mobile = value; 
          });
        },
        onSubmitted: (String value) {
          setState(() {
            mobile = value; 
          });
        },
      ),
    );
  }

  Widget _smsCodeBoxUI() {
    return Container(
      height: ScreenUtil().setHeight(45.0),
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _smsCodeInputUI(),
          _smsCodeButtonUI(),
        ],
      ),
    );
  }

  /// 验证码输入框
  Widget _smsCodeInputUI() {
    return Expanded(
      child: Container(
        height: ScreenUtil().setHeight(45),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(gapPadding: 0.0),
              fillColor: WMColors.themeBackground,
              icon: Text(
                '验证码',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
              suffixStyle: TextStyle(
                color: WMColors.themeRedColor,
              )),
          keyboardType: TextInputType.number,
          onSubmitted: (value) {
            smsCode = value;
          },
        ),
      ),
    );
  }

  /// 验证码按钮
  Widget _smsCodeButtonUI() {
    return Container(
      width: ScreenUtil().setWidth(120.0),
      height: ScreenUtil().setHeight(45),
      margin: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: RaisedButton(
        elevation: 0.0,
        onPressed: getSmsCode,
        child: Text(
          '获取验证码',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
          ),
        ),
      ),
    );
  }

  /// 登录按钮
  Widget _loginButtonUI() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: double.infinity,
      child: RaisedButton(
          color: WMColors.themePrimaryColor,
          child: Container(
            height: ScreenUtil().setHeight(45.0),
            alignment: Alignment.center,
            child: Text(
              '登 录',
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(16.0)),
            ),
          ),
          elevation: 0.0,
          onPressed: login),
    );
  }
}
