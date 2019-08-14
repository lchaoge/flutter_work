import 'package:flutter/widgets.dart';
import 'package:flutter_work/common/utils/public_utils.dart';
import 'package:flutter_work/dao/home_dao.dart';
import 'package:flutter_work/model/home_banner_model.dart';
import 'package:flutter_work/model/home_menu_model.dart';
import 'package:flutter_work/model/home_report_model.dart';
import 'package:flutter_work/model/home_weather_model.dart';
import 'package:provide/provide.dart';
import 'package:flutter_work/provide/home_provide.dart';


class HomeViewModel {
  static Future getHomeData(BuildContext context) async{
    await Future.wait([
      HomeDao.selectBanner(context).then((res){
        return res;
      }),
      HomeDao.selectHomeMenu(context).then((res){
        return res;
      }),
      HomeDao.selectMyRtSale(context).then((res){
        return res;
      }),
      HomeDao.selectWeather(context).then((res){
        return res;
      })
    ]).then((results){
      if (results[0] != null) {
        HomeBannerModel homeBannerModel = HomeBannerModel.fromJson(results[0]);
        Provide.value<HomeProvide>(context).setHomeBanner(homeBannerModel);
      }
      if(results[1]!=null){
        HomeMenuModel homeMenuModel = HomeMenuModel.fromJson(results[1]);
        Provide.value<HomeProvide>(context).setHomeMenu(homeMenuModel);
      }
      if(results[2]!=null){
        HomeReportModel homeMenuModel = HomeReportModel.fromJson(results[2]);
        Provide.value<HomeProvide>(context).setHomeReport(homeMenuModel);
      }
      if(results[3]!=null){
        HomeWeatherModel homeWeatherModel = HomeWeatherModel.fromJson(results[3]);
        Provide.value<HomeProvide>(context).setHomeWeather(homeWeatherModel);
      }
    }).catchError((e){
      PublicUtils.toast(e);
    });
  }
}