import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 通用组件
class PublicUtils {
  
  static toast(String msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: ScreenUtil().setSp(12)
    );
  }

  

  // /**
  //  * 将url参数转换成map
  //  *
  //  * @param param aa=11&bb=22&cc=33
  //  * @return
  //  */
  // static Map<String, Object> getUrlParams(String param) {
  //     Map<String, Object> map = {};
  //     if (PubString.isBlank(param)) {
  //         return map;
  //     }
  //     String[] params = param.split("&");
  //     for (int i = 0; i < params.length; i++) {
  //         String[] p = params[i].split("=");
  //         if (p.length == 2) {
  //             map.put(p[0], p[1]);
  //         }
  //     }
  //     return map;
  // }

  // /**
  //  * 将map转换成url
  //  *
  //  * @param map
  //  * @return
  //  */
  // static String getUrlParamsByMap(Map<String, Object> map) {
  //   if (map == null) {
  //       return "";
  //   }
  //   StringBuffer sb = new StringBuffer();
  //   for (Map.Entry<String, Object> entry : map.entrySet()) {
  //       sb.append(entry.getKey() + "=" + entry.getValue());
  //       sb.append("&");
  //   }
  //   String s = sb.toString();
  //   if (s.endsWith("&")) {
  //       s = StringUtils.substringBeforeLast(s, "&");
  //   }
  //   return s;
  // }

}