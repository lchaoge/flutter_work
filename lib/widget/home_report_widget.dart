import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeReportWidget extends StatelessWidget {

  final TextStyle _titleStyle = TextStyle(
    color:Color.fromRGBO(0, 0, 0, 1.0),
    fontSize: ScreenUtil().setSp(12.0),
    fontWeight: FontWeight.w300,
  );

  final TextStyle _valueStyle = TextStyle(
    color:Color.fromRGBO(34, 34, 34, 1.0),
    fontSize: ScreenUtil().setSp(20.0),
    fontWeight: FontWeight.w500,
  );

  final TextStyle _statisticsTitleStyle = TextStyle(
    color:Color.fromRGBO(102, 102, 102, 1.0),
    fontSize: ScreenUtil().setSp(12.0),
    fontWeight: FontWeight.w400,
  );

  final TextStyle _statisticsValueStyle = TextStyle(
    color:Color.fromRGBO(255, 95, 84, 1.0),
    fontSize: ScreenUtil().setSp(12.0),
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey[300], blurRadius: 10.0),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        )
      ),
      child: Column(
        children: <Widget>[
          _titleUI(),
          _valueUI(),
          _statisticsUI(),
        ],
      ),
    );
  }

  Widget _titleUI(){
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text('实时销售(千元)',style: _titleStyle),
          ),
          Expanded(
            child: Text('日达成(%)',style: _titleStyle),
          ),
          Expanded(
            child: Text('日可比(%)',style: _titleStyle),
          ),
        ],
      ),
    );
  }

  Widget _valueUI(){
    return Container(
      margin: EdgeInsets.only(top: 4.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text('88288879',style: _valueStyle),
          ),
          Expanded(
            child: Text('78.53',style: _valueStyle),
          ),
          Expanded(
            child: Text('-17.29',style: _valueStyle),
          ),
        ]
      ),
    );
  }

  Widget _statisticsUI(){
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Text('交易数',style: _statisticsTitleStyle,),
                Text('144675',style: _statisticsValueStyle,),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Text('净毛(千元)',style: _statisticsTitleStyle,),
                Text('1526',style: _statisticsValueStyle,),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Text('净毛利率',style: _statisticsTitleStyle,),
                Text('1434.46',style: _statisticsValueStyle,),
              ],
            ),
          ),
        ]
      ),
    );
  }

}