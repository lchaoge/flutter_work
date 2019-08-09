import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/model/mail_list_model.dart';
import 'package:flutter_work/provide/mail_list_provide.dart';
import 'package:provide/provide.dart';

class MailListCompanyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<MailListProvide>(
      builder: (context,child,data){
        if(data.mailListModel.code == '0000'){
          List<OrgList> orgList = data.mailListModel.data.orgList;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: orgList.length,
            itemBuilder: (BuildContext context,int index){
              return _inkwellUI(context,orgList[index]);
            },
          );
        }else{
          return Container();
        }
      },
    );
  }

  Widget _inkwellUI(BuildContext context,OrgList orgList){
    return InkWell(
      onTap: (){print('${orgList.orgName}');},
      child: Container(
        height: ScreenUtil().setHeight(50.0),
        padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          width: 0.0,
          color: Colors.black12,
        ))),
        child: Row(
          children: <Widget>[
            Icon(WMIcons.ICON_HOME_MAILLIST,
                size: ScreenUtil().setSp(34.0),
                color: WMColors.themePrimaryColor),
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Text(
                '${orgList.orgName}',
                style: TextStyle(fontSize: ScreenUtil().setSp(14.0),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
