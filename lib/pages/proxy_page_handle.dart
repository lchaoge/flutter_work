import 'package:flutter/material.dart';

/// 待办子页面-待办
class ProxyPageHandle extends StatefulWidget {
  @override
  _ProxyPageHandleState createState() => _ProxyPageHandleState();
}

class _ProxyPageHandleState extends State<ProxyPageHandle> {

  TabBar _bottomAppBar(){
    return TabBar(
      indicatorPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
      indicatorColor: Colors.transparent,
      indicatorSize: null,
      tabs: <Widget>[
        _bottomAppBarItem(false,'未完成',"29"),
        _bottomAppBarItem(false,'升级',"5"),
        _bottomAppBarItem(true,'统计',"0xe646"),
        _bottomAppBarItem(true,'历史',"0xe625"),
      ],
    );
  }

  Widget _bottomAppBarItem(bool isIcon,String title,String value){
    if(isIcon){ // 图标
      return InkWell(
        onTap: (){},
        child: Column(
        children: <Widget>[
          Icon(IconData(int.parse(value)),size: 23.0,color: Color.fromRGBO(77, 155, 249, 1.0),),
          Text(title,style: TextStyle(color: Color.fromRGBO(102, 102, 102, 1.0),fontSize: 14.0),),
        ],
      ),
      );
    }else{
      return InkWell(
        onTap: (){},
        child: Column(
        children: <Widget>[
          Text(value,style: TextStyle(color: Color.fromRGBO(70, 152, 251, 1.0),fontSize: 20.0),),
          Text(title,style: TextStyle(color: Color.fromRGBO(102, 102, 102, 1.0),fontSize: 14.0),),
        ],
      ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Center(child:Text('待办')),
      ),
    );
  }
}