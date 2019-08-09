import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_work/pages/home_page.dart';
import 'package:flutter_work/pages/mail_list_page.dart';
import 'package:flutter_work/pages/proxy_page.dart';
import 'package:flutter_work/pages/member_page.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/provide/index_provide.dart';
import 'package:provide/provide.dart';

class IndexPage extends StatefulWidget{
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with AutomaticKeepAliveClientMixin{
  
  
  @override
  bool get wantKeepAlive => true;

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Image.asset(WMIcons.IMAGE_HOME_WORK,width: ScreenUtil().setWidth(28.0),height: ScreenUtil().setHeight(28.0),),
      activeIcon: Image.asset(WMIcons.IMAGE_HOME_WORK_SELECTED,width: ScreenUtil().setWidth(28.0),height: ScreenUtil().setHeight(28.0),),
      title: Text('工作台')
    ),
    BottomNavigationBarItem(
      icon: Image.asset(WMIcons.IMAGE_HOME_PROXY,width: ScreenUtil().setWidth(28.0),height: ScreenUtil().setHeight(28.0),),
      activeIcon: Image.asset(WMIcons.IMAGE_HOME_PROXY_SELECTED,width: ScreenUtil().setWidth(28.0),height: ScreenUtil().setHeight(28.0),),
      title: Text('待办')
    ),
    BottomNavigationBarItem(
      icon: Image.asset(WMIcons.IMAGE_HOME_MAILLIST,width: ScreenUtil().setWidth(28.0),height: ScreenUtil().setHeight(28.0),),
      activeIcon: Image.asset(WMIcons.IMAGE_HOME_MAILLIST_SELECTED,width: ScreenUtil().setWidth(28.0),height: ScreenUtil().setHeight(28.0),),
      title: Text('通讯录')
    ),
    BottomNavigationBarItem(
      icon: Image.asset(WMIcons.IMAGE_HOME_USER,width: ScreenUtil().setWidth(28.0),height: ScreenUtil().setHeight(28.0),),
      activeIcon: Image.asset(WMIcons.IMAGE_HOME_USER_SELECTED,width: ScreenUtil().setWidth(28.0),height: ScreenUtil().setHeight(28.0),),
      title: Text('我的')
    ),
  ];

  final List tabBodies = [
    HomePage(),
    ProxyPage(),
    MailListPage(),
    MemberPage()
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);//必须添加
    return Provide<IndexProvide>(
      builder: (context,child,data){
        int currentIndex= Provide.value<IndexProvide>(context).navigationBarIndex;
        return Container(
          child: Scaffold(
            backgroundColor: Color.fromRGBO(244,245,245,1.0),
            bottomNavigationBar: BottomNavigationBar(
              unselectedFontSize: ScreenUtil().setSp(12.0),
              selectedFontSize: ScreenUtil().setSp(12.0),
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              items: bottomTabs,
              onTap: (index){
                Provide.value<IndexProvide>(context).changeNavigationBarIndex(index);
              },
            ),
            body: tabBodies[currentIndex],
          ),
        );
      },
    );
  }

}

