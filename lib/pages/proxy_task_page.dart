import 'package:flutter/material.dart';
import 'package:flutter_work/model/home_proxy_model.dart';
import 'package:flutter_work/viewModel/proxy_view_model.dart';
import 'package:flutter_work/widget/proxy_task_appbar_widget.dart';
import 'package:flutter_work/widget/proxy_task_listview_widget.dart';
import 'package:flutter_work/widget/wmui_loading_widget.dart';
import 'package:flutter_work/widget/wmui_nonetwork_widget.dart';
import 'package:provide/provide.dart';
import 'package:flutter_work/provide/proxy_provide.dart';

class ProxyTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProxyViewModel.getCatelist(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return WMuiNonetworkWidget(
              () {
                ProxyViewModel.getCatelist(context);
              },
              text:Provide.value<ProxyProvide>(context).homeProxyModel.msg
            );
          } else {
            HomeProxyModel homeProxyModel = Provide.value<ProxyProvide>(context).homeProxyModel;
            if(homeProxyModel != null && homeProxyModel.code == '0000'){
              return Container(
                height: 200.0,
                child: Column(
                  children: <Widget>[
                    ProxyTaskAppbarWidget(),
                    ProxyTaskListviewWidget(),
                  ],
                ),
              );
            }else{
              return WMuiNonetworkWidget(
                () {
                  ProxyViewModel.getCatelist(context);
                },
                text:homeProxyModel.msg
              );
            }
          }
        } else {
          return WMuiLoadingWidget(
            title: '移动物美',
            fontSize: 40.0,
          );
        }
      },
    );
  }
}