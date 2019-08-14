import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_work/common/config/config.dart';
import 'package:flutter_work/model/user_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/**
 * 用户信息状态
 * Created by chaoge
 * on 2019/7/25.
 */
class UserInfoProvide with ChangeNotifier {
  UserInfoModel userInfoModel = new UserInfoModel();
  bool isLogin = false;

  /// 设置用户信息
  setUserInfo(UserInfoModel userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userInfoStr = json.encode(userInfo.toJson());
    prefs.setString(Config.USER_INFO, userInfoStr);
    userInfoModel = userInfo;
    setLoginState(true);
    notifyListeners();
  }

  /// 设置登录状态
  setLoginState(bool login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(Config.ISLOGIN, login);
    isLogin = login;
    notifyListeners();
  }

  /// 获取登录状态
  getLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    /// 登录状态
    isLogin = prefs.getBool(Config.ISLOGIN) == null
        ? false
        : prefs.getBool(Config.ISLOGIN);

    /// 用户信息
    String userInfoStr = prefs.getString(Config.USER_INFO);
    if (ObjectUtil.isEmptyString(userInfoStr)) {
      userInfoModel = new UserInfoModel();
    } else {
      userInfoModel =
          UserInfoModel.fromJson(json.decode(userInfoStr.toString()));
    }
    notifyListeners();
  }

  /// 删除登录状态
  delLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    /// 登录状态
    prefs.remove(Config.ISLOGIN);

    /// 用户信息
    prefs.remove(Config.USER_INFO);
    await getLoginState();
  }
}
