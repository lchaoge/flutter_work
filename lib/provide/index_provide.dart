import 'package:flutter/material.dart';

/**
 * 首页索引状态
 * Created by chaoge
 * on 2019/7/25.
 */
class IndexProvide with ChangeNotifier {
  int navigationBarIndex= 0;

  int proxyTabsIndex = 0;

  changeNavigationBarIndex(int index){
    navigationBarIndex = index;
    notifyListeners();
  }

  changeProxyTabsIndex(int index){
    proxyTabsIndex = index;
    notifyListeners();
  }

}