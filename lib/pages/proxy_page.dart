import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/pages/proxy_task_page.dart';
import 'package:flutter_work/provide/index_provide.dart';
import 'package:provide/provide.dart';

/**
 * 待办页面
 */
class ProxyPage extends StatefulWidget {
  @override
  _ProxyPageState createState() => _ProxyPageState();
}

class _ProxyPageState extends State<ProxyPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _currentIndex = 1;
  VoidCallback onchanged;

  @override
  void initState() {
    super.initState();
    _controller =
        new TabController(initialIndex: _currentIndex, length: 4, vsync: this);
    onchanged = () {
      setState(() {
        _currentIndex = this._controller.index;
      });
    };
    _controller.addListener(onchanged);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Container(
          child: Scaffold(
              appBar: _appbar(context),
              body: Provide<IndexProvide>(
                builder: (context, child, data) {
                  // int proxyTabsIndex = data.proxyTabsIndex;
                  return TabBarView(
                    children: [
                      Container(
                        child: ProxyTaskPage(),
                      )
                    ],
                  );
                },
              )),
        ));
  }

  _appbar(BuildContext context) {
    return AppBar(
      elevation: 0.5,
        backgroundColor: Colors.white,
        centerTitle: false,
        leading: Container(
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: WMColors.themePrimaryColor,
            indicatorWeight: 3.0,
            indicatorPadding: EdgeInsets.all(0.0),
            labelPadding: EdgeInsets.all(0.0),
            tabs: [
              Tab(
                child: Text(
                  '任务',
                  style: TextStyle(
                    color: Colors.black, fontSize: ScreenUtil().setSp(20.0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
