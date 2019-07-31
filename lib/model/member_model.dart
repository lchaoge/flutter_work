class MemberModel {
  String code;
  String msg;
  MemberData data;
  String result;

  MemberModel({this.code, this.msg, this.data, this.result});

  MemberModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new MemberData.fromJson(json['data']) : null;
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['result'] = this.result;
    return data;
  }
}

class MemberData {
  String retailerNo;
  String clientNo;
  String userNo;
  String userName;
  String mobile;
  String siteNo;
  String siteName;
  String orgCode;
  String orgName;
  String postCode;
  String postName;
  String dutyName;
  String ukGroups;
  String isPartTime;
  String costCenterCode;
  String costCenterName;
  String leaderNames;
  String email;
  String headImgUrl;
  String pinyin;
  String orgNamePath;
  String area;
  String userGroup;
  String subGroup;
  String rankCode;
  String rankName;
  String status;

  MemberData(
      {this.retailerNo,
      this.clientNo,
      this.userNo,
      this.userName,
      this.mobile,
      this.siteNo,
      this.siteName,
      this.orgCode,
      this.orgName,
      this.postCode,
      this.postName,
      this.dutyName,
      this.ukGroups,
      this.isPartTime,
      this.costCenterCode,
      this.costCenterName,
      this.leaderNames,
      this.email,
      this.headImgUrl,
      this.pinyin,
      this.orgNamePath,
      this.area,
      this.userGroup,
      this.subGroup,
      this.rankCode,
      this.rankName,
      this.status});

  MemberData.fromJson(Map<String, dynamic> json) {
    retailerNo = json['retailerNo'];
    clientNo = json['clientNo'];
    userNo = json['userNo'];
    userName = json['userName'];
    mobile = json['mobile'];
    siteNo = json['siteNo'];
    siteName = json['siteName'];
    orgCode = json['orgCode'];
    orgName = json['orgName'];
    postCode = json['postCode'];
    postName = json['postName'];
    dutyName = json['dutyName'];
    ukGroups = json['ukGroups'];
    isPartTime = json['isPartTime'];
    costCenterCode = json['costCenterCode'];
    costCenterName = json['costCenterName'];
    leaderNames = json['leaderNames'];
    email = json['email'];
    headImgUrl = json['headImgUrl'];
    pinyin = json['pinyin'];
    orgNamePath = json['orgNamePath'];
    area = json['area'];
    userGroup = json['userGroup'];
    subGroup = json['subGroup'];
    rankCode = json['rankCode'];
    rankName = json['rankName'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['retailerNo'] = this.retailerNo;
    data['clientNo'] = this.clientNo;
    data['userNo'] = this.userNo;
    data['userName'] = this.userName;
    data['mobile'] = this.mobile;
    data['siteNo'] = this.siteNo;
    data['siteName'] = this.siteName;
    data['orgCode'] = this.orgCode;
    data['orgName'] = this.orgName;
    data['postCode'] = this.postCode;
    data['postName'] = this.postName;
    data['dutyName'] = this.dutyName;
    data['ukGroups'] = this.ukGroups;
    data['isPartTime'] = this.isPartTime;
    data['costCenterCode'] = this.costCenterCode;
    data['costCenterName'] = this.costCenterName;
    data['leaderNames'] = this.leaderNames;
    data['email'] = this.email;
    data['headImgUrl'] = this.headImgUrl;
    data['pinyin'] = this.pinyin;
    data['orgNamePath'] = this.orgNamePath;
    data['area'] = this.area;
    data['userGroup'] = this.userGroup;
    data['subGroup'] = this.subGroup;
    data['rankCode'] = this.rankCode;
    data['rankName'] = this.rankName;
    data['status'] = this.status;
    return data;
  }
}