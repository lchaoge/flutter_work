import 'package:flutter/widgets.dart';
import 'package:flutter_work/dao/home_dao.dart';
import 'package:flutter_work/model/home_banner_model.dart';
import 'package:flutter_work/model/home_menu_model.dart';
import 'package:provide/provide.dart';
import 'package:flutter_work/provide/home_provide.dart';


class HomeViewModel {
  static Future getHomeData(BuildContext context) async{
    await Future.wait([
      HomeDao.getBanner(context).then((res){
        return res;
      }),
      HomeDao.getHomeMenu(context).then((res){
        return res;
      })
    ]).then((results){
      if (results[0] != null) {
        HomeBannerModel homeBannerModel = HomeBannerModel.fromJson(results[0]);
        if (homeBannerModel.code == '0000') {
          Provide.value<HomeProvide>(context)
              .setHomeBanner(homeBannerModel);
        }
      }
      if(results[1]!=null){
        HomeMenuModel homeMenuModel = HomeMenuModel.fromJson(results[1]);
        if(homeMenuModel.code == '0000'){
          Provide.value<HomeProvide>(context).setHomeMenu(homeMenuModel);
        }
      }
    }).catchError((e){
      print(e);
    });
  }
}