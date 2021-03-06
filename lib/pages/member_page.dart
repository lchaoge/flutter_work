import 'package:flutter/material.dart';
import 'package:flutter_work/viewModel/member_view_model.dart';
import 'package:flutter_work/widget/member_cell_widget.dart';
import 'package:flutter_work/widget/member_userinfo_widget.dart';
import 'package:flutter_work/widget/wmui_loading_widget.dart';
import 'package:flutter_work/widget/wmui_nonetwork_widget.dart';

class MemberPage extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: FutureBuilder(
          future: MemberViewModel.getAddrDetail(context),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              if (snapshot.hasError) {
                return WMuiNonetworkWidget(
                  (){
                    MemberViewModel.getAddrDetail(context);
                  },
                ); 
              } else {
                return Container(
                  child: ListView(
                    children: <Widget>[
                      MemberUserinfoWidget(),
                      MemberCellWidget(),
                    ],
                  ),
                );
              }
            }else{
              return WMuiLoadingWidget(
                title: '移动物美',
                fontSize: 40.0,
              );
            }
          },
        )
      ),
    );
  }
}