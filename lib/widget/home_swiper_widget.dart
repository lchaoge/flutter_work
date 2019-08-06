import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/utils/public_utils.dart';
import 'package:flutter_work/model/home_banner_model.dart';
import 'package:provide/provide.dart';
import 'package:flutter_work/provide/home_provide.dart';

/**
 * 首页轮播组件
 */
class HomeSwiperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<HomeProvide>(
      builder: (context, child, data) {
        List<HomeBannerData> homeBannerData = data.homeBannerModel.data;
        return Container(
          height: ScreenUtil().setHeight(70.0),
          margin: EdgeInsets.symmetric(horizontal: 15.0),
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    PublicUtils.toast(homeBannerData[index].newsUrl);
                  },
                  child: Image.network(
                    homeBannerData[index].imgUrl,
                  ));
            },
            itemCount: homeBannerData.length,
            pagination: SwiperPagination(),
            autoplay: homeBannerData.length > 1 ? true : false,
          ),
        );
      },
    );
  }
}
