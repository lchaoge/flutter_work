import 'package:flutter_work/model/home_banner_model.dart';
import 'package:flutter_work/model/home_menu_model.dart';
import 'package:flutter/material.dart';

class HomeProvide with ChangeNotifier {

  HomeBannerModel homeBannerModel = new HomeBannerModel();
  HomeMenuModel homeMenuModel = new HomeMenuModel();
  

  setHomeMenu(HomeMenuModel homeMenu) {
    homeMenuModel = homeMenu;
    notifyListeners();
  }

  setHomeBanner(HomeBannerModel homeBanner){
    homeBannerModel = homeBanner;
    notifyListeners();
  }

  
}
