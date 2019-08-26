import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/model/home_banner_model.dart';
import 'package:flutter_work/router/navigator_util.dart';
import 'package:provide/provide.dart';
import 'package:flutter_work/provide/home_provide.dart';
import 'package:transparent_image/transparent_image.dart';

/// 首页轮播组件
class HomeSwiperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<HomeProvide>(
      builder: (context, child, data) {
        List<HomeBannerData> homeBannerData = data.homeBannerModel.data;
        if (homeBannerData != null && homeBannerData.length > 0) {
          return Container(
            height: ScreenUtil().setHeight(70.0),
            margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Map params = {
                      "isSiteUse": 0,
                      "title": '',
                      "url": homeBannerData[index].newsUrl,
                      "isAppTitle": 0
                    };
                    NavigatorUtil.goWebViewPage(context, false, params);
                  },
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: '${homeBannerData[index].imgUrl}',
                  ),
                );
              },
              itemCount: homeBannerData.length,
              pagination: SwiperPagination(),
              autoplay: homeBannerData.length > 1 ? true : false,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
