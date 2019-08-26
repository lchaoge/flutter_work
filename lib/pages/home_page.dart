import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/model/home_weather_model.dart';
import 'package:flutter_work/provide/home_provide.dart';
import 'package:flutter_work/router/navigator_util.dart';
import 'package:flutter_work/viewModel/home_view_model.dart';
import 'package:flutter_work/widget/home_menu_widget.dart';
import 'package:flutter_work/widget/home_report_widget.dart';
import 'package:flutter_work/widget/home_swiper_widget.dart';
import 'package:flutter_work/widget/wmui_loading_widget.dart';
import 'package:flutter_work/widget/wmui_nonetwork_widget.dart';
import 'package:provide/provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';

/// 工作台
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: _appbar(context),
      body: Container(
        child: FutureBuilder(
          future: HomeViewModel.getHomeData(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return WMuiNonetworkWidget(
                  () {
                    HomeViewModel.getHomeData(context);
                  },
                );
              } else {
                return Container(
                    child: EasyRefresh(
                      firstRefresh: true,
                  onRefresh: () async {
                    await HomeViewModel.getHomeData(context);
                  },
                  header: BezierCircleHeader(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    backgroundColor: WMColors.themePrimaryColor,
                  ),
                  child: ListView(
                    children: <Widget>[
                      HomeReportWidget(),
                      HomeSwiperWidget(),
                      HomeMenuWidget(),
                    ],
                  ),
                ));
              }
            } else {
              return WMuiLoadingWidget(
                title: '移动物美',
                fontSize: 40.0,
              );
            }
          },
        ),
      ),
    ));
  }

  Widget _appbar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Provide<HomeProvide>(
        builder: (context, child, data) {
          String weatherInfo = data.homeMenuModel.data == null
              ? ''
              : data.homeMenuModel.data.weatherInfo;
          return Container(
              child: Row(
            children: <Widget>[
              Text(
                '$weatherInfo',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(12.0),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(15.0),
              ),
              _appbarWeather(context),
            ],
          ));
        },
      ),
      actions: <Widget>[
        IconButton(
          padding: EdgeInsets.all(0.0),
          iconSize: ScreenUtil().setSp(18.0),
          icon: Icon(Icons.crop_free),
          onPressed: () {
            NavigatorUtil.goScanPage(context, false);
          },
        ),
        IconButton(
          padding: EdgeInsets.all(0.0),
          iconSize: ScreenUtil().setSp(18.0),
          icon: Icon(Icons.chat),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _appbarWeather(BuildContext context) {
    return Provide<HomeProvide>(
      builder: (context, child, data) {
        HomeWeatherModel homeWeatherModel = data.homeWeatherModel;
        if (homeWeatherModel.city != null) {
          Widget _wea_img;
          // xue, lei, shachen, wu, bingbao, yun, yu, yin, qing
          if (homeWeatherModel.data[0].weaImg == 'yun') {
            /// 云
            _wea_img = Icon(
              Icons.wb_cloudy,
              color: Colors.white,
              size: ScreenUtil().setSp(12.0),
            );
          } else if (homeWeatherModel.data[0].weaImg == 'qing') {
            /// 晴
            _wea_img = Icon(
              Icons.wb_sunny,
              color: Color.fromRGBO(255, 220, 11, 1),
              size: ScreenUtil().setSp(12.0),
            );
          } else if (homeWeatherModel.data[0].weaImg == 'xue') {
            /// 雪
            _wea_img = Icon(
              Icons.ac_unit,
              color: Colors.white,
              size: ScreenUtil().setSp(12.0),
            );
          }

          return Row(
            children: <Widget>[
              Text(
                '${homeWeatherModel.data[0].wea}  ${homeWeatherModel.data[0].tem1}-${homeWeatherModel.data[0].tem2}',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(12.0),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(5.0),
              ),
              _wea_img
            ],
          );
        } else {
          return Text('');
        }
      },
    );
  }
}
