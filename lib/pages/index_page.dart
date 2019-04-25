import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_work/pages/home_page.dart';
import 'package:flutter_work/pages/cart_page.dart';
import 'package:flutter_work/pages/proxy_page.dart';
import 'package:flutter_work/pages/membedr_page.dart';
import 'package:flutter_work/common/style/wm_style.dart';


class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  int currentIndex = 0;
  var currentPage;

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(WMIcons.WORK),
      activeIcon: Icon(WMIcons.WORK_SELECTED),
      title: Text('工作台')
    ),
    BottomNavigationBarItem(
      icon: Icon(WMIcons.PROXY),
      activeIcon: Icon(WMIcons.PROXY_SELECTED),
      title: Text('待办')
    ),
    BottomNavigationBarItem(
      icon: Icon(WMIcons.MAILLIST),
      activeIcon: Icon(WMIcons.MAILLIST_SELECTED),
      title: Text('通讯录')
    ),
    BottomNavigationBarItem(
      icon: Icon(WMIcons.USER),
      activeIcon: Icon(WMIcons.USER_SELECTED),
      title: Text('我的')
    ),
  ];

  final List tabBodies = [
    HomePage(),
    ProxyPage(),
    CartPage(),
    MembedrPage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = tabBodies[currentIndex];

  }

  @override
  Widget build(BuildContext context) {

    //设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667, allowFontScaling: true)..init(context);
    print('设备像素密度：${ScreenUtil.pixelRatio}');
    print('设备的高：${ScreenUtil.screenHeight}');
    print('设备的宽：${ScreenUtil.screenWidth}');

    return Container(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(244,245,245,1.0),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: bottomTabs,
          onTap: (index){
            setState(() {
              currentIndex = index;
              currentPage = tabBodies[currentIndex];
            });
          },
        ),
        body: currentPage,
      ),
    );
  }
}
