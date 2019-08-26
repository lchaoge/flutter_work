import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/common/utils/public_utils.dart';
import 'package:flutter_work/model/home_menu_model.dart';
import 'package:flutter_work/provide/home_provide.dart';
import 'package:flutter_work/router/navigator_util.dart';
import 'package:provide/provide.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Provide<HomeProvide>(
      builder: (context, child, data) {
        if (data.homeMenuModel.code == '0000') {
          MenuInfo menuInfo = data.homeMenuModel.data.menuInfo;
          return Column(
            children: _containerUI(context, menuInfo.cid),
          );
        } else {
          return Container();
        }
      },
    ));
  }

  List<Widget> _containerUI(BuildContext context, List<Cid> cidList) {
    List<Widget> result = [];
    cidList.map((item) {
      if (!ObjectUtil.isEmptyString(item.menuName) &&
          !ObjectUtil.isEmptyList(item.cid)) {
        result.add(Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _titleUI(item.menuName),
              _groupMenuUI(context, item.cid),
            ],
          ),
        ));
      }
    }).toList();
    return result;
  }

  Widget _titleUI(String menuName) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0),
      child: Text(
        menuName,
        style: TextStyle(
          color: Color.fromRGBO(34, 34, 34, 1.0),
          fontSize: ScreenUtil().setSp(18.0),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _groupMenuUI(BuildContext context, List<Cid> cldList) {
    return Container(
      padding: EdgeInsets.all(0.0),
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        children: cldList.map((item) => _menuItemUI(context, item)).toList(),
      ),
    );
  }

  Widget _menuItemUI(BuildContext context, Cid item) {
    return InkWell(
      onTap: () {
        if (item.isJumpWeb == 1) {
          Map params = {
            "isSiteUse": item.isSiteUse,
            "title": item.menuName,
            "url": item.menuUrl,
            "isAppTitle": item.isAppTitle
          };
          NavigatorUtil.goWebViewPage(context, false, params);
        } else {
          PublicUtils.toast('暂未开发');
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        width: ScreenUtil().setWidth(83),
        height: ScreenUtil().setHeight(64),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FadeInImage.memoryNetwork(
              width: ScreenUtil().setWidth(26.0),
              height: ScreenUtil().setHeight(26.0),
              placeholder: kTransparentImage,
              image: item.menuIcon != null
                  ? '${item.menuIcon}'
                  : WMIcons.IMAGE_LOGO,
            ),
            Container(
              margin: EdgeInsets.only(top: 7.0),
              child: Text(
                '${item.menuName}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color.fromRGBO(34, 34, 34, 1.0),
                  fontSize: ScreenUtil().setSp(12.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
