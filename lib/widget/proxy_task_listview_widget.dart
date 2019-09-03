import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/model/home_proxy_model.dart';
import 'package:flutter_work/viewModel/home_view_model.dart';
import 'package:flutter_work/viewModel/proxy_view_model.dart';
import 'package:flutter_work/provide/proxy_provide.dart';
import 'package:flutter_work/widget/wmui_nodata_widget.dart';
import 'package:flutter_work/widget/wmui_nonetwork_widget.dart';
import 'package:provide/provide.dart';

class ProxyTaskListviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[_noticeUI(), _listviewUI(context)],
      ),
    );
  }

  Widget _noticeUI() {
    return Provide<ProxyProvide>(builder: (context, child, data) {
      HomeProxyModel homeProxyModel = data.homeProxyModel;
      if (homeProxyModel != null && homeProxyModel.code == '0000') {
        if (homeProxyModel.data.urgeCount == 0) {
          return Container(
            child: Text(''),
          );
        } else {
          return Container(
            margin: EdgeInsets.all(15.0),
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
                  child: Text(
                      '有${homeProxyModel.data.urgeCount}项任务已升级到区总，需要您尽快处理！',
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
      }
    });
  }

  Widget _listviewUI(BuildContext context) {
    return Provide<ProxyProvide>(builder: (context, child, data) {
      HomeProxyModel homeProxyModel = data.homeProxyModel;
      if (homeProxyModel != null && homeProxyModel.code == '0000') {
        List<CateList> cateList = homeProxyModel.data.cateList;
        if (cateList.length > 0) {
          return Container(
              child: EasyRefresh(
            onRefresh: () async {
              await ProxyViewModel.getCatelist(context);
            },
            header: BallPulseHeader(),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cateList.length,
              itemBuilder: (BuildContext context, int index) {
                return _listviewItemUI(cateList[index], data.distributerType);
              },
            ),
          ));
        } else {
          return WMuiNoDataWidget('暂无任务');
        }
      } else {
        return WMuiNonetworkWidget(
          () {
            HomeViewModel.getHomeData(context);
          },
          text: homeProxyModel.msg,
        );
      }
    });
  }

  Widget _listviewItemUI(CateList item, int distributerType) {
    return Container(
        margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
        child: Card(
            child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(56.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _taskNameUI(item.taskCategoryName),
                  Row(
                    children: <Widget>[
                      _upgradeOrSuperviseUI('${item.upgradeCount}', '升级',
                          WMColors.themeDangerColor),
                      _upgradeOrSuperviseUI(
                          distributerType == 0
                              ? '${item.totalCount}'
                              : '${item.taskCategory}',
                          distributerType == 0 ? '待办' : '督办',
                          Color.fromRGBO(34, 34, 34, 1.0)),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: _isBadegUI(),
            )
          ],
        )));
  }

  /// 是不是升级
  Widget _isBadegUI() {
    return Container(
      width: ScreenUtil().setWidth(5.0),
      height: ScreenUtil().setHeight(56.0),
      color: WMColors.themeDangerColor,
    );
  }

  /// 任务名字
  Widget _taskNameUI(String taskCategoryName) {
    return Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        '$taskCategoryName',
        style: TextStyle(
            color: Color.fromRGBO(34, 34, 34, 1.0),
            fontSize: ScreenUtil().setSp(20.0),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  /// 升级或督办
  Widget _upgradeOrSuperviseUI(String value, String title, Color color) {
    return Container(
        margin: EdgeInsets.only(right: 20.0),
        child: Row(
          children: <Widget>[
            Text(value,
                style: TextStyle(
                    color: color,
                    fontSize: ScreenUtil().setSp(24.0),
                    fontWeight: FontWeight.bold)),
            SizedBox(
              width: ScreenUtil().setWidth(7.0),
            ),
            Text(title,
                style: TextStyle(
                    color: color,
                    fontSize: ScreenUtil().setSp(12.0),
                    fontWeight: FontWeight.w500)),
          ],
        ));
  }
}
