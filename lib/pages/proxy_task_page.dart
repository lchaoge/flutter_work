import 'package:flutter/material.dart';
import 'package:flutter_work/widget/proxy_task_appbar_widget.dart';
import 'package:flutter_work/widget/proxy_task_listview_widget.dart';

class ProxyTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ProxyTaskAppbarWidget(),
          ProxyTaskListviewWidget(),
        ],
      ),
    );
  }
}