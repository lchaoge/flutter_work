import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/viewModel/mail_list_view_model.dart';
import 'package:flutter_work/viewModel/proxy_view_model.dart';
import 'package:flutter_work/widget/mail_list_company_widget.dart';
import 'package:flutter_work/widget/mail_list_people_widget.dart';

class MailListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MailListViewModel.getSearchAddrOrgList(context,'');
    return Container(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text('通讯录',style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1.0),
              fontSize: ScreenUtil().setSp(20.0),
              fontWeight: FontWeight.bold
            ),),
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: ListView(
              children: <Widget>[
                MailListPeopleWidget(),
                MailListCompanyWidget(),
              ],
            ),
          )
          
        ),
    );
  }
}
