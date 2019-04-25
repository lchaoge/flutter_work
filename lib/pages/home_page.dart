import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:convert';

import 'package:flutter_work/common/style/wm_style.dart';
// import 'package:flutter_work/service/service_method.dart';

/// 工作台
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();

  static final String mockdata = '''[
     
      {
        "title":"工作台",
        "children":[
          {"icon":"0xe648","text":"任务清单"},
          {"icon":"0xe61f","text":"盘点"},
          {"icon":"0xe61d","text":"服务台换购"},
          {"icon":"0xe625","text":"携出单"},
          {"icon":"0xe620","text":"仓位管理"}
        ]
      },
      {
        "title":"门店管理",
        "children":[
          {"icon":"0xe648","text":"任务清单"},
          {"icon":"0xe61f","text":"盘点"},
          {"icon":"0xe61d","text":"服务台换购"},
          {"icon":"0xe625","text":"携出单"},
          {"icon":"0xe620","text":"仓位管理"},
          {"icon":"0xe644","text":"一码到底"},
          {"icon":"0xe619","text":"通讯录"},
          {"icon":"0xe650","text":"物美邮箱"},
          {"icon":"0xe64f","text":"请假"},
          {"icon":"0xe64e","text":"审批中心"},
          {"icon":"0xe64d","text":"出差"},
          {"icon":"0xe64c","text":"月度考评"},
          {"icon":"0xe640","text":"携出单"}
        ]
      },
      {
        "title":"协同办公",
        "children":[
          {"icon":"0xe648","text":"任务清单"},
          {"icon":"0xe61f","text":"盘点"},
          {"icon":"0xe61d","text":"服务台换购"},
          {"icon":"0xe625","text":"携出单"},
          {"icon":"0xe620","text":"仓位管理"},
          {"icon":"0xe644","text":"一码到底"}
        ]
      }
    ]''';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    AppBar _appBarWidget(){
      return AppBar(
        title: Text(
          '周四 10月17日 重阳节  晴 3/-4°',
          style: TextStyle(
            fontSize: ScreenUtil(allowFontScaling: true).setSp(12),
            color: Color.fromRGBO(255, 255, 255, 1.0),
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              print('扫一扫');
            },
            icon: Icon(
              WMIcons.SCAN,
              color: Colors.white,
              size: ScreenUtil(allowFontScaling: true).setSp(18),
            )
          ),
          IconButton(
            onPressed: (){
              print('消息');
            },
            icon: Icon(
              WMIcons.NEWS,
              color: Colors.white,
              size: ScreenUtil(allowFontScaling: true).setSp(18),
            )
          ),
        ],
      );
    }
   
    return Container(
      child: Scaffold(
        appBar: _appBarWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SwiperWidget(),
              MenuWidget(menuList: mockdata)
            ],
          )
        ),
      ),
    );
  }
}


/// 轮播图
class SwiperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.0,
        left: 15.0,
        right: 15.0,
        bottom: 10.0
      ),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: ScreenUtil(allowFontScaling: true).setWidth(345),
        itemHeight: ScreenUtil(allowFontScaling: true).setHeight(70),
        itemBuilder: (context, index) {
          return Image.asset('static/images/banner.png',fit: BoxFit.fill,);
        },
        itemCount: 10
      )
    );
  }
}

/// 菜单
class MenuWidget extends StatelessWidget {

  final String menuList;

  MenuWidget({Key key,this.menuList}):super(key:key);

  /// 标题
  Widget _menuTitle (String title){
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 10.0, 0, 10.0),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil(allowFontScaling: true).setSp(18),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// 菜单按钮
  Widget _menuItem(BuildContext context,item){
    return InkWell(
      onTap: (){
        print(item['text']);
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 23.0),
              child: Icon(
                IconData(
                  int.parse(item['icon']), 
                  fontFamily: WMIcons.FONT_FAMILY,
                ),
                size:30.0,
                color: Color.fromRGBO(43, 128, 241, 1.0),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                item['text'],
                style: TextStyle(
                  color: Color.fromRGBO(34, 34, 34, 1.0),
                  fontWeight: FontWeight.w400,
                  fontSize: ScreenUtil(allowFontScaling: true).setSp(12),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
  
  /// 菜单列表
  Widget _girdViewWidget(BuildContext context,list){
    List<Widget> _children = List<Widget>();
    for (var item in list) {
      _children.add(_menuItem(context,item));
    }
    var _width = ScreenUtil(allowFontScaling: true).setWidth(375);
    var _height = ((list.length/4).ceil()*(_width~/4)).toDouble();
    return Container(
      width: ScreenUtil(allowFontScaling: true).setWidth(375),
      height: ScreenUtil(allowFontScaling: true).setHeight(_height),
      child: GridView.count(
        physics: new NeverScrollableScrollPhysics(), // 禁止滑动
        addAutomaticKeepAlives: false,
        scrollDirection: Axis.vertical,
        mainAxisSpacing: 0,
        crossAxisCount: 4,
        children: _children
      ),
    );
  }

  List<Widget> _menuWidget(BuildContext context,menuList){
    List<Widget> result = new List<Widget>();
    for (var item in menuList) {
      result.add(
        Column(
          children: <Widget>[
            _menuTitle(item['title']),
            _girdViewWidget(context,item['children'])
          ],
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {

    final myobj = json.decode(menuList).toList();
    return Column(
      children:_menuWidget(context,myobj),
    );
  }
}

