import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_work/common/utils/public_utils.dart';
import 'package:flutter_work/router/navigator_util.dart';
import 'package:flutter_work/widget/wmui_loading_widget.dart';

class WebviewPage extends StatefulWidget {
  
  final String title;
  final String url;
  final String isAppTitle;
  WebviewPage(this.url,{this.title, this.isAppTitle = '0'});

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {

  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebviewScaffold(
        url: "${widget.url}",
        appBar: _appbar(context),
        initialChild: WMuiLoadingWidget(),
      ),
    );
  }
    PreferredSizeWidget _appbar(BuildContext context){
      if(widget.isAppTitle == '0'){
        final double statusBarHeight = MediaQuery.of(context).padding.top;
        return PreferredSize(
          preferredSize: Size.fromHeight(statusBarHeight),
          child: Text(''),
        );
      }
      return AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            NavigatorUtil.router.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: ScreenUtil().setSp(40.0),
          ),
        ),
        title: Text(
          "${widget.title}",
          style: TextStyle(
              color: Colors.black, fontSize: ScreenUtil().setSp(18.0)),
        ),
      );
    }
}

