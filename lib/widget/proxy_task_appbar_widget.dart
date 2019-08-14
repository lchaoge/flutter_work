import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/common/utils/public_utils.dart';
import 'package:flutter_work/model/home_proxy_model.dart';
import 'package:flutter_work/viewModel/proxy_view_model.dart';
import 'package:provide/provide.dart';
import 'package:flutter_work/provide/proxy_provide.dart';

class ProxyTaskAppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Provide<ProxyProvide>(
          builder: (context,child,data){
            HomeProxyModel homeProxyModel = data.homeProxyModel;
            List<Widget> tabBar = [];
            if(homeProxyModel !=null && homeProxyModel.code == '0000'){
              tabBar = <Widget>[
                _tabBarItemUI('${homeProxyModel.data.todoCount}','未完成',false,(){
                  Provide.value<ProxyProvide>(context).setDistributerType(0);
                  ProxyViewModel.getCatelist(context);
                },color: WMColors.themePrimaryColor),
                _tabBarItemUI('${homeProxyModel.data.urgeCount}','升级',false,(){
                  Provide.value<ProxyProvide>(context).setDistributerType(2);
                  ProxyViewModel.getCatelist(context);
                },color: WMColors.themeDangerColor),
                _tabBarItemUI(WMIcons.IMAGE_TECHREPORT,'统计',true,(){
                  PublicUtils.toast('统计');
                },),
                _tabBarItemUI(WMIcons.IMAGE_LISHI,'历史',true,(){
                  PublicUtils.toast('历史');
                },),
              ];
            }
            return Row(
              children: tabBar,
            );
          },
        )
      );
  }

  Widget _tabBarItemUI(String value, String title, bool isImage,VoidCallback onTap,
      {Color color,String url}) {
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
        onTap: onTap,
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
