import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/utils/public_utils.dart';
import 'package:flutter_work/model/home_menu_model.dart';
import 'package:flutter_work/provide/home_provide.dart';
import 'package:provide/provide.dart';

class HomeMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Provide<HomeProvide>(
      builder: (context, child, data) {
        MenuInfo menuInfo = data.homeMenuModel.data.menuInfo;
        return Column(
          children: _containerUI(menuInfo.cid),
        );
      },
    ));
  }

  List<Widget> _containerUI(List<Cid> cidList) {
    List<Widget> result = [];
    cidList.map((item) {
      if (!ObjectUtil.isEmptyString(item.menuName) &&
          !ObjectUtil.isEmptyList(item.cid)) {
        result.add(Container(
          child: Column(
            children: <Widget>[
              _titleUI(item.menuName),
              _groupMenuUI(item.cid),
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

  Widget _groupMenuUI(List<Cid> cldList) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        children: cldList.map((item) => _menuItemUI(item.menuIcon, item.menuName)).toList(),
      ),
    );
  }

  Widget _menuItemUI(String menuIcon, String menuName) {
    return InkWell(
      onTap: (){
        PublicUtils.toast(menuName);
      },
      child: Container(
        width: ScreenUtil().setWidth(82),
        height: ScreenUtil().setHeight(64),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(
              menuIcon,
              width: ScreenUtil().setWidth(26.0),
              height: ScreenUtil().setHeight(26.0),
            ),
            Container(
              margin: EdgeInsets.only(top: 7.0),
              child: Text(
                menuName,
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
