import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';

class WMuiNonetworkWidget extends StatelessWidget {

  String image;
  String text;
  String buttonText;
  VoidCallback callback;
  WMuiNonetworkWidget(this.callback,{this.image,this.text,this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          _imageUI(),
          _textUI(),
          _buttonUI(),
        ],
      ),
    );
  }

  // 图片
  Widget _imageUI(){
    return Container(
      width: ScreenUtil().setWidth(125.0),
      height: ScreenUtil().setHeight(111.0),
      child: Image.network(image!=null?image:WMIcons.IMAGE_NO_NET,fit:BoxFit.cover),
    );
  }

  // 描述
  Widget _textUI(){
    return Container(
      margin: EdgeInsets.only(top: 17.0),
      alignment: Alignment.center,
      child: Text(
        text!=null?text:'网络不太顺畅哦～',
        style:TextStyle(
          color: Color.fromRGBO(153, 153, 153, 1.0),
          fontSize: ScreenUtil().setSp(14.0),
        ),
      ),
    );
  }

  // 按钮
  Widget _buttonUI(){
    return Container(
      margin: EdgeInsets.only(top: 22.0),
      alignment: Alignment.center,
      child: RaisedButton(
        color: WMColors.themePrimaryColor,
        onPressed: callback,
        child: Text(
          buttonText!=null?buttonText:'重新加载试试',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      )
    );
  }

}