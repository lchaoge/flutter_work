import 'package:flutter/material.dart';

import 'package:flutter_work/pages/proxy_page_handle.dart';
import 'package:flutter_work/pages/proxy_page_approval.dart';

/// 待办页面
class ProxyPage extends StatefulWidget {
  
  @override
  _ProxyPageState createState() => _ProxyPageState();
}

class _ProxyPageState extends State<ProxyPage> {

  final _kTabs = <Tab>[
    Tab(child: Text('待办',style: TextStyle(color: Colors.black),),),
    Tab(child: Text('审批',style: TextStyle(color: Colors.black),),),
  ];
  
  final _kTabPages = <Widget>[
    ProxyPageHandle(),
    ProxyPageApproval()
  ];

  AppBar _proxyAppBar(){
    return AppBar(
      backgroundColor: Colors.white,
      title: TabBar(
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 3.0,
        unselectedLabelStyle: TextStyle(fontSize: 16.0),
        labelStyle: TextStyle(fontSize: 20.0),
        tabs: _kTabs,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: _kTabs.length,
        child: Scaffold(
          appBar: _proxyAppBar(),
          body: TabBarView(
            children: _kTabPages,
          )
        ),
      ),
    );
  }
}