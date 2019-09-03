import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/dao/user_info_dao.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/common/utils/public_utils.dart';
import 'package:flutter_work/model/device_model.dart';
import 'package:flutter_work/model/user_info_model.dart';
import 'package:flutter_work/router/navigator_util.dart';
import 'package:provide/provide.dart';
import 'package:flutter_work/provide/device_provide.dart';
import 'package:flutter_work/provide/user_info_provide.dart';
import 'package:common_utils/common_utils.dart';

/*
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
  FocusNode focusNodeMobile = new FocusNode();
  FocusNode focusNodeSmsCode = new FocusNode();
  String mobile, smsCode;
  Timer _countdownTimer;
  String _codeCountdownStr = '获取验证码';
  int _countdownNum = 59;
  bool isClickSmsCode = false;

  @override
  void initState() {
    super.initState();
  }

  void getSmsCode() async {
    if(isClickSmsCode){
      return;
    }

    DeviceModel deviceModel = Provide.value<DeviceProvide>(context).deviceModel;
    await UserInfoDao.selectSmsCode(mobile, deviceModel).then((res) {
      if(res!=null){
        if (res['code'] == '0000') {
          reGetCountdown();
          if (res['data'] != null) {
            setState(() {
              smsCode = res['data']['smsCode'];
            });
          }
        } else {
          PublicUtils.toast(res['msg']);
        }
      }
    });
  }

  void reGetCountdown() {
    // 点击键盘上的 "下一步" 回调
    focusNodeMobile.unfocus();
    FocusScope.of(context).requestFocus(focusNodeSmsCode);
    
    setState(() {
      isClickSmsCode = true;
      if (_countdownTimer != null) {
          return;
      }
      // Timer的第一秒倒计时是有一点延迟的，为了立刻显示效果可以添加下一行。
      _codeCountdownStr = '${_countdownNum--}重新获取';
      _countdownTimer =
          new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          if (_countdownNum > 0) {
            _codeCountdownStr = '${_countdownNum--}重新获取';
          } else {
            _codeCountdownStr = '获取验证码';
            _countdownNum = 59;
            _countdownTimer.cancel();
            _countdownTimer = null;
            isClickSmsCode = false;
          }
        });
      });
    });
  }

 // 不要忘记在这里释放掉Timer
 @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }

  login() async {
     // 点击键盘上的 "完成" 回调
    // 关闭弹出的键盘
    focusNodeSmsCode.unfocus();
    // 如果没有关联focusnode 要关闭键盘可以用：  FocusScope.of(context).requestFocus(FocusNode());


    Provide.value<DeviceProvide>(context)
        .setMobileAndSmsCode(mobile: mobile, smsCode: smsCode);
    DeviceModel deviceModel = Provide.value<DeviceProvide>(context).deviceModel;
    await UserInfoDao.login(deviceModel).then((res) {
      if(res!=null){
        UserInfoModel userInfoModel = UserInfoModel.fromJson(res);
        if (userInfoModel.code == '0000') {
          if (userInfoModel.data != null) {
            Provide.value<UserInfoProvide>(context).setUserInfo(userInfoModel);
            Provide.value<UserInfoProvide>(context).setLoginState(true);
            NavigatorUtil.goIndexPage(context, true);
          } else {
            Provide.value<UserInfoProvide>(context).setLoginState(false);
          }
        } else {
          PublicUtils.toast(userInfoModel.msg);
        }
      }
    });
  }

  _validateUsername(String value) {
    if (value.isEmpty) {
      PublicUtils.toast('请输入手机号');
      return false;
    }
    if(value.length>=11){
      if(!RegexUtil.isMobileExact(value)){
        PublicUtils.toast('手机号格式错误');
        return false;
      }
    }
    
    setState(() {
      mobile = value;
    });
  }

  _validateSmsCode(value) {
    if (value.isEmpty) {
      PublicUtils.toast('请输入验证码');
      return false;
    }
    setState(() {
      smsCode = value;
    });
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
        style: TextStyle(
          fontSize: ScreenUtil().setSp(14.0),
        ),
        autofocus: true,
        focusNode: focusNodeMobile,
        keyboardType: TextInputType.number,
        autocorrect: true,
        textInputAction: TextInputAction.none,
        onChanged: _validateUsername,
        onSubmitted: (_) {
          // 点击键盘上的 "下一步" 回调
          focusNodeMobile.unfocus();
          FocusScope.of(context).requestFocus(focusNodeSmsCode);
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
          onChanged: _validateSmsCode,
        ),
      ),
    );
  }

  /// 验证码按钮
  Widget _smsCodeButtonUI() {
    return Container(
      width: ScreenUtil().setWidth(130.0),
      height: ScreenUtil().setHeight(45),
      margin: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: RaisedButton(
        elevation: 0.0,
        onPressed: isClickSmsCode?null:getSmsCode,
        child: Text(
          _codeCountdownStr,
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
