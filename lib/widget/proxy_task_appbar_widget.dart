import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';

class ProxyTaskAppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Row(
        children: <Widget>[
          _tabBarItemUI('29','未完成',false,color: WMColors.themePrimaryColor),
          _tabBarItemUI('5','升级',false,color: WMColors.themeDangerColor),
          _tabBarItemUI(WMIcons.IMAGE_TECHREPORT,'统计',true),
          _tabBarItemUI(WMIcons.IMAGE_LISHI,'历史',true),
        ],
      ),
    );
  }

  Widget _tabBarItemUI(String value, String title, bool isImage,
      {Color color}) {
    Widget _imageWidget = Image.asset(
      value,
      width: ScreenUtil().setWidth(23.0),
      height: ScreenUtil().setHeight(23.0),
    );
    Widget _valueWidget = Text(
      value,
      style: TextStyle(
          color: color,
          fontSize: ScreenUtil().setSp(20.0),
          fontWeight: FontWeight.w600),
    );
    Widget _title = Container(
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        title,
        style: TextStyle(
            color: Color.fromRGBO(102, 102, 102, 1.0),
            fontSize: ScreenUtil().setSp(14.0)),
      ),
    );
    return Expanded(
      child: InkWell(
        onTap: null,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[isImage ? _imageWidget : _valueWidget, _title],
          ),
        ),
      )
    );
  }

}
