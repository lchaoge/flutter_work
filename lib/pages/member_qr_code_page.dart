import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';
import 'package:flutter_work/model/member_model.dart';
import 'package:flutter_work/provide/member_provide.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provide/provide.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MemberQRCodePage extends StatelessWidget {
  /// 打开相册
  Future _getPhoto(BuildContext context, String type) async {
    ImageSource source =
        type == 'Camera' ? ImageSource.camera : ImageSource.gallery;
    File image = await ImagePicker.pickImage(source: source);
    Navigator.pop(context);
    print(image);
  }

  /// 打开相册菜单
  _showModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    width: 0.5,
                    color: Colors.black12,
                  ))),
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  child: new Text(
                    "相机",
                    style: TextStyle(fontSize: ScreenUtil().setSp(16.0)),
                  ),
                ),
                onTap: () {
                  _getPhoto(context, 'Camera');
                },
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  child: new Text(
                    "相册",
                    style: TextStyle(fontSize: ScreenUtil().setSp(16.0)),
                  ),
                ),
                onTap: () {
                  _getPhoto(context, 'Gallery');
                },
              ),
              SizedBox(
                height: 10.0,
                child: Container(
                  color: WMColors.themeBackground,
                ),
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  child: new Text(
                    "取消",
                    style: TextStyle(fontSize: ScreenUtil().setSp(16.0)),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

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
          title: Text('我的二维码', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
        ),
        body: Provide<MemberProvide>(
          builder: (context, child, data) {
            MemberData memberData = data.memberModel.data;
            return Container(
                padding: EdgeInsets.all(15.0),
                child: Card(
                    elevation: 5.0, //设置阴影
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(4.0))), //设置圆角
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        _userInfoUI(context, memberData),
                        _qrCodeBoxUI(context, memberData),
                      ],
                    )));
          },
        ),
      ),
    );
  }

  /// 用户信息
  Widget _userInfoUI(BuildContext context, MemberData memberData) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _photoBoxUI(context, memberData),
          _mobileUI(memberData.mobile),
          _emailUI(memberData.email, memberData.userNo),
        ],
      ),
    );
  }

  /// 头像容器
  Widget _photoBoxUI(BuildContext context, MemberData memberData) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _photoNameUI(
              memberData.userName, memberData.orgName, memberData.postName),
          InkWell(
            child: _photoUI(memberData.headImgUrl),
            onTap: () {
              _showModal(context);
            },
          )
        ],
      ),
    );
  }

  /// 头像名称
  Widget _photoNameUI(String userName, String orgName, String postName) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              userName,
              style: TextStyle(
                  color: Color.fromRGBO(34, 34, 34, 1.0),
                  fontSize: ScreenUtil().setSp(24),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Text(
              '$orgName $postName',
              style: TextStyle(
                  color: Color.fromRGBO(102, 102, 102, 1.0),
                  fontSize: ScreenUtil().setSp(12),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  /// 头像
  Widget _photoUI(String headImgUrl) {
    return Container(
      width: ScreenUtil().setWidth(60.0),
      height: ScreenUtil().setHeight(60.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.0), color: Colors.white),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          CircleAvatar(
            radius: 60.0,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              ObjectUtil.isEmptyString(headImgUrl)
                  ? WMIcons.IMAGE_DEFAULT_USER
                  : headImgUrl,
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   width: ScreenUtil().setWidth(60.0),
          //   height: ScreenUtil().setHeight(18.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Color.fromRGBO(183, 206, 241, 0.9),
          //     ),
          //     alignment: Alignment.center,
          //     child: Text('编辑',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: ScreenUtil().setSp(12.0),
          //         )),
          //   ),
          // )
        ],
      ),
    );
  }

  /// 手机号
  Widget _mobileUI(String mobile) {
    return Container(
      margin: EdgeInsets.only(top: 37.0),
      child: Text(
        mobile,
        style: TextStyle(
            color: Color.fromRGBO(102, 102, 102, 1.0),
            fontSize: ScreenUtil().setSp(12.0),
            fontWeight: FontWeight.w400),
      ),
    );
  }

  /// 邮箱
  Widget _emailUI(String email, String userNo) {
    return Container(
        margin: EdgeInsets.only(top: 3.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              email,
              style: TextStyle(
                  color: Color.fromRGBO(102, 102, 102, 1.0),
                  fontSize: ScreenUtil().setSp(12.0),
                  fontWeight: FontWeight.w400),
            ),
            Row(
              children: <Widget>[
                Text(
                  'NO.',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1.0),
                      fontSize: ScreenUtil().setSp(12.0),
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  userNo,
                  style: TextStyle(
                      color: Color.fromRGBO(102, 102, 102, 1.0),
                      fontSize: ScreenUtil().setSp(12.0),
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ));
  }

  /// 二维码容器
  Widget _qrCodeBoxUI(BuildContext context, MemberData memberData) {
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
          _siteUI(memberData.siteNo, memberData.siteName),
          _qrCodeUI(memberData.mobile, memberData.headImgUrl),
          _qrCodeDescUI(),
        ],
      ),
    );
  }

  /// 门店
  Widget _siteUI(String siteNo, String siteName) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        '$siteName-$siteNo',
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1.0),
          fontSize: ScreenUtil().setSp(14.0),
        ),
      ),
    );
  }

  /// 二维码
  Widget _qrCodeUI(String mobile, String headImgUrl) {
    return Container(
      width: ScreenUtil().setWidth(200.0),
      height: ScreenUtil().setHeight(200.0),
      child: QrImage(
        data: mobile,
        size: ScreenUtil().setWidth(200.0),
        onError: (ex) {
          print("[QR] ERROR - $ex");
        },
      ),
    );
  }

  /// 二维码描述
  Widget _qrCodeDescUI() {
    return Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(252),
      child: Text(
        '员工二维码用于系统授权使用，请勿转发给他人 三分钟内有效',
        style: TextStyle(
          color: Color.fromRGBO(102, 102, 102, 1.0),
          fontSize: ScreenUtil().setSp(12.0),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
