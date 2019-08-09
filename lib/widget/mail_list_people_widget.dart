import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/model/mail_list_model.dart';

class MailListPeopleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        
      ],
    );
  }

  Widget _inkwellUI(BuildContext context,UserList userList){
    return InkWell(
      onTap: (){print('${userList.userName}');},
      child: Container(
        height: ScreenUtil().setHeight(50.0),
        padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.0,
              color: Colors.black12,
            )
          )
        ),
        child: Row(
          children: <Widget>[
            Image.asset(
              '${userList.orgNamePath}',
              width: ScreenUtil().setWidth(34.0),
              height: ScreenUtil().setHeight(34.0),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${userList.userName}',style: TextStyle(
                    fontSize: ScreenUtil().setSp(14.0),
                    color: Color.fromRGBO(0, 0, 0, 1.0),
                  ),),
                  Text('${userList.postName}',style: TextStyle(
                    fontSize: ScreenUtil().setSp(12.0),
                    color: Color.fromRGBO(102, 102, 102, 1.0),
                  ),),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}