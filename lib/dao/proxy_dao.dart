import 'package:flutter_work/common/utils/http_utils.dart';
import 'package:flutter_work/common/utils/url_mapping.dart';

class ProxyDao {

  /// 获取任务首页
  static Future selectCatelist(Map params,Map headers){
    return HttpUtils.request(UrlMapping.POST_proxy_TASK_CATELIST,method: HttpUtils.POST, data: params,headers: headers);
  }
}