import 'package:flutter_work/common/utils/http_utils.dart';
import 'package:flutter_work/common/utils/url_mapping.dart';

class MemberDao {
  /// 获取用户信息
  static Future selectAddrDetail(Map memberData){
    return HttpUtils.request(UrlMapping.POST_HRS_V1_GETADDRDETAIL,method: HttpUtils.POST, data: memberData);
  }
}