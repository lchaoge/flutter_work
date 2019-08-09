import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_work/common/utils/public_utils.dart';
import 'package:flutter_work/dao/proxy_dao.dart';
import 'package:flutter_work/model/home_menu_model.dart';
import 'package:flutter_work/model/home_proxy_model.dart';
import 'package:flutter_work/provide/proxy_provide.dart';
import 'package:flutter_work/provide/home_provide.dart';
import 'package:provide/provide.dart';

class ProxyViewModel {
  static Future getCatelist(BuildContext context) async {
    Map params = {
      'distributerType': Provide.value<ProxyProvide>(context).distributerType
    };
    UserInfo userInfo =
        Provide.value<HomeProvide>(context).homeMenuModel.data.userInfo;

    Map<String, dynamic> headers = {
      'currentUserAccount': userInfo.userNo,
      'currentUserName': base64Encode(utf8.encode(userInfo.userName)),
    };
    await ProxyDao.selectCatelist(params, headers).then((res) {
      if (res != null) {
        HomeProxyModel homeProxyModel = HomeProxyModel.fromJson(res);
        Provide.value<ProxyProvide>(context).setCatelist(homeProxyModel);
      }
    });
  }
}
