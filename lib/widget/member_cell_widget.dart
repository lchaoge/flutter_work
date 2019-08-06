import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/utils/public_utils.dart';
import 'package:flutter_work/provide/device_provide.dart';
import 'package:flutter_work/router/navigator_util.dart';
import 'package:provide/provide.dart';

class MemberCellWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DeviceProvide>(
      builder: (context, child, data) {
        String appVerCode = data.deviceModel.appVerCode;
        return Container(
          child: Column(
            children: <Widget>[
              _listTileUI(true, () {
                PublicUtils.toast('审批中心账号解绑');
              },
                  icon: Icons.https,
                  color: Color.fromRGBO(255, 137, 137, 1.0),
                  title: '审批中心账号解绑'),
              _listTileUI(true, () {
                NavigatorUtil.goMemberSharePage(context, false);
              },
                  icon: Icons.share,
                  color: Color.fromRGBO(255, 163, 0, 1.0),
                  title: '分享App'),
              _listTileUI(false, () {
                PublicUtils.toast('当前版本号');
              },
                  icon: Icons.edit_location,
                  color: Color.fromRGBO(74, 144, 226, 1.0),
                  title: '当前版本号：$appVerCode',
                  enabled:false
                ),
              SizedBox(
                height: ScreenUtil().setHeight(10.0),
              ),
              _listTileUI(false, () {
                PublicUtils.toast('退出登陆');
              },
                  icon: Icons.signal_wifi_off,
                  color: Color.fromRGBO(244, 93, 93, 1.0),
                  title: '退出登陆'),
            ],
          ),
        );
      },
    );
  }

  /// 单个ListTile
  Widget _listTileUI(bool isShowBorder, VoidCallback onTap,
      {IconData icon, Color color, String title,bool enabled = true}) {
    return Container(
      height: ScreenUtil().setHeight(50.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
                width: isShowBorder ? 0.5 : -0.0,
                color: isShowBorder ? Colors.black12 : Colors.white),
          )),
      child: ListTile(
        enabled: enabled,
        onTap: onTap,
        leading: Icon(
          icon,
          size: ScreenUtil().setSp(20),
          color: color,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: Color.fromRGBO(34, 34, 34, 1.0),
              fontSize: ScreenUtil().setSp(14.0),
              fontWeight: FontWeight.w400),
        ),
        trailing: enabled?Icon(
          Icons.keyboard_arrow_right,
          color: Color.fromRGBO(198, 198, 198, 1.0),
        ):Icon(
          Icons.keyboard_arrow_right,
          color: Color.fromRGBO(198, 198, 198, 1.0),
          size: 0.0,
        ),
      ),
    );
  }
}
