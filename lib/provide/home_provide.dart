import 'package:flutter_work/model/home_banner_model.dart';
import 'package:flutter_work/model/home_menu_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_work/model/home_report_model.dart';
import 'package:flutter_work/model/home_weather_model.dart';

class HomeProvide with ChangeNotifier {

  HomeBannerModel homeBannerModel = new HomeBannerModel();
  HomeMenuModel homeMenuModel = new HomeMenuModel();
  HomeReportModel homeReportModel = new HomeReportModel();
  HomeWeatherModel homeWeatherModel = new HomeWeatherModel();
  

  setHomeMenu(HomeMenuModel homeMenu) {
    homeMenuModel = homeMenu;
    notifyListeners();
  }

  setHomeBanner(HomeBannerModel homeBanner){
    homeBannerModel = homeBanner;
    notifyListeners();
  }

  setHomeReport(HomeReportModel homeReport){
    homeReportModel = homeReport;
    notifyListeners();
  }

  setHomeWeather(HomeWeatherModel homeWeather){
    homeWeatherModel = homeWeather;
    notifyListeners();
  }
  
}
