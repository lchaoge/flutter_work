import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/provide/home_provide.dart';
import 'package:flutter_work/viewModel/home_view_model.dart';
import 'package:flutter_work/widget/home_menu_widget.dart';
import 'package:flutter_work/widget/home_report_widget.dart';
import 'package:flutter_work/widget/home_swiper_widget.dart';
import 'package:flutter_work/widget/wmui_loading_widget.dart';
import 'package:flutter_work/widget/wmui_nonetwork_widget.dart';
import 'package:provide/provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';

/**
 * 工作台
 */
class HomePage extends StatelessWidget {
  final GlobalKey<RefreshHeaderState> _headerkey =
      new GlobalKey<RefreshHeaderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: _appbar(),
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
                    firstRefresh:true,
                    onRefresh: () async {
                      await HomeViewModel.getHomeData(context);
                    },
                    refreshHeader: BezierCircleHeader(
                      key: _headerkey,
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
                  )
                );
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

  Widget _appbar() {
    return AppBar(
      elevation: 0.0,
      title: Provide<HomeProvide>(
        builder: (context,child,data){
          
          String weatherInfo = data.homeMenuModel.data==null?'':data.homeMenuModel.data.weatherInfo;
          return Container(
            child: Row(
              children: <Widget>[
                Text(
                  weatherInfo,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(12.0),
                    fontWeight: FontWeight.w400,
                    
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(15.0),
                ),
                Text(
                  '晴 3/-4°',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(12.0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(4.0),
                ),
                Icon(
                  Icons.wb_sunny,
                  color: Color.fromRGBO(255, 220, 11, 1),
                  size: ScreenUtil().setSp(12.0),
                ),
              ],
            )
          );
        },
      ),
      actions: <Widget>[
        IconButton(
          padding: EdgeInsets.all(0.0),
          iconSize: ScreenUtil().setSp(18.0),
          icon: Icon(Icons.crop_free),
          onPressed: () {},
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
}
