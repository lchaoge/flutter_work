import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';

class ProxyTaskListviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_noticeUI(), _listviewUI()],
      ),
    );
  }

  Widget _noticeUI() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.wb_incandescent,
              color: WMColors.themeDangerColor,
              size: 17.0,
            ),
          ),
          Expanded(
            child: Text('有1项任务已升级到区总，需要您尽快处理！',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: WMColors.themeDangerColor,
                    fontSize: ScreenUtil().setSp(14.0))),
          ),
          Container(
            child: Icon(
              Icons.keyboard_arrow_right,
              color: Color.fromRGBO(175, 175, 175, 1.0),
              size: 20.0,
            ),
          )
        ],
      ),
    );
  }

  Widget _listviewUI() {
    return Container(
      child: Text('列表'),
    );
  }
}
