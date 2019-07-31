import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// 分享二维码
class MemberSharePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_arrow_left,
                color: Colors.black, size: 40.0),
          ),
          title: Text('分享二维码', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Card(
            elevation: 5.0, //设置阴影
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(4.0))), //设置圆角
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _qrCodeBoxUI(context),
              ],
            )
          )
        ),
        ),
    );
  }

  /// 二维码容器
  Widget _qrCodeBoxUI(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
        width: 0.5,
        color: Colors.black12,
      ))),
      child: Column(
        children: <Widget>[
          _titleUI(),
          _qrCodeUI(),
          _shareTitleUI(),
          _shareIconUI(),
        ],
      ),
    );
  }

  Widget _titleUI() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Text(
        '扫描二维码下载“移动物美App”',
        style: TextStyle(
          color: Color.fromRGBO(34, 34, 34, 1.0),
          fontSize: ScreenUtil().setSp(16.0),
        ),
      ),
    );
  }

  Widget _qrCodeUI() {
    return Container(
      width: ScreenUtil().setWidth(250.0),
      height: ScreenUtil().setHeight(250.0),
      child: QrImage(
        data: '13260094140',
        size: ScreenUtil().setWidth(250.0),
        onError: (ex) {
          print("[QR] ERROR - $ex");
        },
      ),
    );
  }

 Widget _shareTitleUI() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Text(
        '或分享至',
        style: TextStyle(
          color: Color.fromRGBO(102,102,102,1.0),
          fontSize: ScreenUtil().setSp(14.0),
        ),
      ),
    );
  }

  Widget _shareIconUI() {
    return Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(250),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(Icons.query_builder,size: 34.0,color: Color.fromRGBO(0, 122, 255, 1.0),),
          Icon(Icons.web,size: 34.0,color: Color.fromRGBO(0, 204, 0, 1.0),),
          Icon(Icons.whatshot,size: 34.0,color: Color.fromRGBO(41, 181, 232, 1.0),),
        ],
      )
    );
  }
}
