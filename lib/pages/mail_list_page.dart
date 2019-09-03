import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/viewModel/mail_list_view_model.dart';
import 'package:flutter_work/widget/mail_list_company_widget.dart';
import 'package:flutter_work/widget/mail_list_people_widget.dart';
import 'package:flutter_work/widget/wmui_loading_widget.dart';
import 'package:flutter_work/widget/wmui_nonetwork_widget.dart';

class MailListPage extends StatefulWidget {
  final String orgCode;
  MailListPage({this.orgCode});
  @override
  _MailListPageState createState() => _MailListPageState();
}

class _MailListPageState extends State<MailListPage>
    with AutomaticKeepAliveClientMixin {
  Future<dynamic> getSearchAddrOrgList;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // getSearchAddrOrgList =
    //     MailListViewModel.getSearchAddrOrgList(context, widget.orgCode);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        child: Scaffold(
      appBar: _appbar(),
      body: FutureBuilder(
        future: MailListViewModel.getSearchAddrOrgList(context, widget.orgCode),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Container(
                height: 300.0,
                child: WMuiNonetworkWidget(
                    () {
                      MailListViewModel.getSearchAddrOrgList(
                          context, widget.orgCode);
                    },
                  ),
              );
            } else {
              return Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListView(
                  children: <Widget>[
                    MailListPeopleWidget(),
                    MailListCompanyWidget(),
                  ],
                ),
              );
            }
          } else {
            return WMuiLoadingWidget(
              title: '移动物美',
              fontSize: 40.0,
            );
          }
        },
      ),
    ));
  }

  Widget _appbar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Text(
        '通讯录',
        style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1.0),
            fontSize: ScreenUtil().setSp(20.0),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
