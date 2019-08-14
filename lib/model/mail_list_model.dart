class MailListModel {
  String code;
  String msg;
  MailListData data;
  String result;

  MailListModel({this.code, this.msg, this.data, this.result});

  MailListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new MailListData.fromJson(json['data']) : null;
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

class MailListData {
  List<UserList> userList;
  List<OrgList> orgList;

  MailListData({this.userList, this.orgList});

  MailListData.fromJson(Map<String, dynamic> json) {
    if (json['userList'] != null) {
      userList = new List<UserList>();
      json['userList'].forEach((v) {
        userList.add(new UserList.fromJson(v));
      });
    }
    if (json['orgList'] != null) {
      orgList = new List<OrgList>();
      json['orgList'].forEach((v) {
        orgList.add(new OrgList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userList != null) {
      data['userList'] = this.userList.map((v) => v.toJson()).toList();
    }
    if (this.orgList != null) {
      data['orgList'] = this.orgList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserList {
  String retailerNo;
  String clientNo;
  String userNo;
  String userName;
  String orgNamePath;
  String postName;
  String headImgUrl;

  UserList(
      {this.retailerNo,
      this.clientNo,
      this.userNo,
      this.userName,
      this.orgNamePath,
      this.postName,
      this.headImgUrl});

  UserList.fromJson(Map<String, dynamic> json) {
    retailerNo = json['retailerNo'];
    clientNo = json['clientNo'];
    userNo = json['userNo'];
    userName = json['userName'];
    orgNamePath = json['orgNamePath'];
    postName = json['postName'];
    headImgUrl = json['headImgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['retailerNo'] = this.retailerNo;
    data['clientNo'] = this.clientNo;
    data['userNo'] = this.userNo;
    data['userName'] = this.userName;
    data['orgNamePath'] = this.orgNamePath;
    data['postName'] = this.postName;
    data['headImgUrl'] = this.headImgUrl;
    return data;
  }
}

class OrgList {
  String retailerNo;
  String clientNo;
  String orgCode;
  String orgName;
  String orgType;

  OrgList(
      {this.retailerNo,
      this.clientNo,
      this.orgCode,
      this.orgName,
      this.orgType});

  OrgList.fromJson(Map<String, dynamic> json) {
    retailerNo = json['retailerNo'];
    clientNo = json['clientNo'];
    orgCode = json['orgCode'];
    orgName = json['orgName'];
    orgType = json['orgType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['retailerNo'] = this.retailerNo;
    data['clientNo'] = this.clientNo;
    data['orgCode'] = this.orgCode;
    data['orgName'] = this.orgName;
    data['orgType'] = this.orgType;
    return data;
  }
}