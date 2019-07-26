import 'package:flutter/material.dart';
import 'package:flutter_work/model/user_info_model.dart';

/**
 * 用户信息状态
 * Created by chaoge
 * on 2019/7/25.
 */
class UserInfoProvide with ChangeNotifier{
  UserInfoModel userInfoModel = new UserInfoModel();
  bool isLogin = false;

  /// 设置用户信息
  setUserInfo(UserInfoModel userInfoModel) {
    userInfoModel = userInfoModel;
    notifyListeners();
  }

  /// 设置登录状态
  setLoginState(bool isLogin){
    isLogin = isLogin;
  }
}
