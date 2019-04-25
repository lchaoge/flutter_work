import 'dart:async';
import 'package:flutter_work/config/url_mapping.dart';
import 'package:flutter_work/config/http_utils.dart';

class HomePageService{
  /// 获取详情
  static Future getMenuList() async{
    var params = {
      "appVerCode" : "V3.0.0",
      "appVerNo" : "45",
      "appVerTime" : "2019-04-23 12:00",
      "deviceBrand" : "Apple#iPhone 6s Plus",
      "deviceNo" : "3092D061-BDE7-42A9-A56C-518DCD5DA512",
      "deviceType" : 2,
      "ip" : "10.111.88.16",
      "mobile" : "13161016006",
      "retailerNo" : "wumart",
      "userName" : "\U4faf\U65b9\U6d9b",
      "userNo" : "00350603",
    };
    var result = await HttpUtils.request(UrlMapping.POST_COMM_V1_MAIN,data: params,method: HttpUtils.POST,);
    print(result);
    return result;
  }
}


// // GET 请求
// // 返回的结果直接就是 json 格式
// // 要使用 await，必须在方法名后面加上 async
// _handleGetShelf () async {
//   var result = await HttpUtils.request(
//     '/gysw/shelf', 
//     method: HttpUtils.GET,
//     data: {
//       'id': 1,
//     }
//   );
// }


// // POST 请求
// _handleAddShelf () async {
//   var result = await HttpUtils.request(
//     '/gysw/shelf', 
//     method: HttpUtils.POST,
//     data: {
//       'id': 1,
//     }
//   );
// }

// // PUT 请求
// _handleEditShelf () async{
//   var result = await HttpUtils.request(
//     '/gysw/shelf/:id', 
//     method: HttpUtils.PUT,
//     data: {
//       'id': 1,
//     }
//   );
// }

// // DELETE 请求
// _handleDelShelf () async {
//   var result = await HttpUtils.request(
//     '/gysw/shelf/:id', 
//     method: HttpUtils.DELETE,
//     data: {
//       'id': 1,
//     }
//   );
// }