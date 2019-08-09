import 'package:flutter/material.dart';
import 'package:flutter_work/model/home_proxy_model.dart';

class ProxyProvide with ChangeNotifier {
  int distributerType = 0;
  HomeProxyModel homeProxyModel = new HomeProxyModel();

  setCatelist(HomeProxyModel catelist){
    homeProxyModel = catelist;
    notifyListeners();
  }

  setDistributerType(int type){
    distributerType = type;
    notifyListeners();
  }

}