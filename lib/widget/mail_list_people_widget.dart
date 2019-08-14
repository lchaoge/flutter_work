import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/model/mail_list_model.dart';
import 'package:provide/provide.dart';
import 'package:flutter_work/provide/mail_list_provide.dart';

class MailListPeopleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<MailListProvide>(
      builder: (context, child, data) {
        if (data.mailListModel.code == '0000') {
          List<UserList> userList = data.mailListModel.data.userList;
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: userList.length,
              itemBuilder: (BuildContext context, int index) {
                return _inkwellUI(context, userList[index]);
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _headImgUrlUI(String headImgUrl) {
    if (!ObjectUtil.isEmptyString(headImgUrl)) {
      return Image.network(
        '$headImgUrl',
        fit: BoxFit.cover,
        width: ScreenUtil().setWidth(34.0),
        height: ScreenUtil().setHeight(34.0),
      );
    } else {
      return Image.asset(
        WMIcons.IMAGE_DEFAULT_USER,
        width: ScreenUtil().setWidth(34.0),
        height: ScreenUtil().setHeight(34.0),
      );
    }
  }

  Widget _inkwellUI(BuildContext context, UserList userList) {
    return InkWell(
      onTap: () {
        print('${userList.userName}');
      },
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
            _headImgUrlUI(userList.headImgUrl),
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${userList.userName}',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14.0),
                      color: Color.fromRGBO(0, 0, 0, 1.0),
                    ),
                  ),
                  Text(
                    '${userList.postName}',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(12.0),
                      color: Color.fromRGBO(102, 102, 102, 1.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
