import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/model/home_report_model.dart';
import 'package:flutter_work/provide/home_provide.dart';
import 'package:provide/provide.dart';

class HomeReportWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<HomeProvide>(
      builder: (context, child, data) {
        if (data.homeReportModel.code == '0000') {
          HomeReportData homeReportData = data.homeReportModel.data;
          return Container(
            padding: EdgeInsets.all(15.0),
            margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey[300], blurRadius: 10.0),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                )),
            child: Column(
              children: <Widget>[
                _titleUI(),
                _valueUI(homeReportData),
                _statisticsUI(homeReportData),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  final TextStyle _valueStyle = TextStyle(
    color: Color.fromRGBO(34, 34, 34, 1.0),
    fontSize: ScreenUtil().setSp(20.0),
    fontWeight: FontWeight.w500,
  );

  final TextStyle _titleStyle = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1.0),
    fontSize: ScreenUtil().setSp(12.0),
    fontWeight: FontWeight.w300,
  );

  final TextStyle _statisticsTitleStyle = TextStyle(
    color: Color.fromRGBO(102, 102, 102, 1.0),
    fontSize: ScreenUtil().setSp(12.0),
    fontWeight: FontWeight.w400,
  );

  final TextStyle _statisticsValueStyle = TextStyle(
    color: Color.fromRGBO(255, 95, 84, 1.0),
    fontSize: ScreenUtil().setSp(12.0),
    fontWeight: FontWeight.w400,
  );

  Widget _titleUI() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text('实时销售(千元)', style: _titleStyle),
          ),
          Expanded(
            child: Text('日达成(%)', style: _titleStyle),
          ),
          Expanded(
            child: Text(
              '日可比(%)',
              style: _titleStyle,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _valueUI(HomeReportData homeReportData) {
    return Container(
      margin: EdgeInsets.only(top: 4.0),
      child: Row(children: <Widget>[
        Expanded(
          flex: 2,
          child: Text('${homeReportData.saleamt}', style: _valueStyle),
        ),
        Expanded(
          child: Text('${homeReportData.saleamtRate}', style: _valueStyle),
        ),
        Expanded(
          child: Text(
            '${homeReportData.compasaleamtrate}',
            style: _valueStyle,
            textAlign: TextAlign.end,
          ),
        ),
      ]),
    );
  }

  Widget _statisticsUI(HomeReportData homeReportData) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(children: <Widget>[
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '交易数',
                style: _statisticsTitleStyle,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                '${homeReportData.cnt}',
                style: _statisticsValueStyle,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '净毛(千元)',
                style: _statisticsTitleStyle,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                '${homeReportData.rofit}',
                style: _statisticsValueStyle,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '净毛利率',
                style: _statisticsTitleStyle,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                '${homeReportData.profitratio}',
                style: _statisticsValueStyle,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
