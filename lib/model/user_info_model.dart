/*
 * 用户信息
 * Created by chaoge
 * on 2019/7/25.
 */
class UserInfoModel {
  String code;
  String msg;
  UserInfoData data;
  String result;

  UserInfoModel({this.code, this.msg, this.data, this.result});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new UserInfoData.fromJson(json['data']) : null;
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

class UserInfoData {
  List<CgTree> cgTree;
  UserInfo userInfo;
  List<YyTree> yyTree;
  List<WlTree> wlTree;
  AuthInfo authInfo;

  UserInfoData({this.cgTree, this.userInfo, this.yyTree, this.wlTree, this.authInfo});

  UserInfoData.fromJson(Map<String, dynamic> json) {
    if (json['cgTree'] != null) {
      cgTree = new List<CgTree>();
      json['cgTree'].forEach((v) {
        cgTree.add(new CgTree.fromJson(v));
      });
    }
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
    if (json['yyTree'] != null) {
      yyTree = new List<YyTree>();
      json['yyTree'].forEach((v) {
        yyTree.add(new YyTree.fromJson(v));
      });
    }
    if (json['wlTree'] != null) {
      wlTree = new List<WlTree>();
      json['wlTree'].forEach((v) {
        wlTree.add(new WlTree.fromJson(v));
      });
    }
    authInfo = json['authInfo'] != null
        ? new AuthInfo.fromJson(json['authInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cgTree != null) {
      data['cgTree'] = this.cgTree.map((v) => v.toJson()).toList();
    }
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
    if (this.yyTree != null) {
      data['yyTree'] = this.yyTree.map((v) => v.toJson()).toList();
    }
    if (this.wlTree != null) {
      data['wlTree'] = this.wlTree.map((v) => v.toJson()).toList();
    }
    if (this.authInfo != null) {
      data['authInfo'] = this.authInfo.toJson();
    }
    return data;
  }
}

class CgTree {
  int userId;
  String permRoleName;
  int permRoleId;
  int permNodeId;
  int permType;

  CgTree(
      {this.userId,
      this.permRoleName,
      this.permRoleId,
      this.permNodeId,
      this.permType});

  CgTree.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    permRoleName = json['permRoleName'];
    permRoleId = json['permRoleId'];
    permNodeId = json['permNodeId'];
    permType = json['permType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['permRoleName'] = this.permRoleName;
    data['permRoleId'] = this.permRoleId;
    data['permNodeId'] = this.permNodeId;
    data['permType'] = this.permType;
    return data;
  }
}

class UserInfo {
  String orgName;
  String userMobile;
  String manageMandt;
  String postName;
  String userNo;
  String mandt;
  String userTel;
  String userName;
  int userId;
  String account;

  UserInfo(
      {this.orgName,
      this.userMobile,
      this.manageMandt,
      this.postName,
      this.userNo,
      this.mandt,
      this.userTel,
      this.userName,
      this.userId,
      this.account});

  UserInfo.fromJson(Map<String, dynamic> json) {
    orgName = json['orgName'];
    userMobile = json['userMobile'];
    manageMandt = json['manageMandt'];
    postName = json['postName'];
    userNo = json['userNo'];
    mandt = json['mandt'];
    userTel = json['userTel'];
    userName = json['userName'];
    userId = json['userId'];
    account = json['account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orgName'] = this.orgName;
    data['userMobile'] = this.userMobile;
    data['manageMandt'] = this.manageMandt;
    data['postName'] = this.postName;
    data['userNo'] = this.userNo;
    data['mandt'] = this.mandt;
    data['userTel'] = this.userTel;
    data['userName'] = this.userName;
    data['userId'] = this.userId;
    data['account'] = this.account;
    return data;
  }
}

class YyTree {
  int userId;
  String permRoleName;
  int permRoleId;
  int permNodeId;
  int permType;

  YyTree(
      {this.userId,
      this.permRoleName,
      this.permRoleId,
      this.permNodeId,
      this.permType});

  YyTree.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    permRoleName = json['permRoleName'];
    permRoleId = json['permRoleId'];
    permNodeId = json['permNodeId'];
    permType = json['permType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['permRoleName'] = this.permRoleName;
    data['permRoleId'] = this.permRoleId;
    data['permNodeId'] = this.permNodeId;
    data['permType'] = this.permType;
    return data;
  }
}

class WlTree {
  int userId;
  String permRoleName;
  int permRoleId;
  int permNodeId;
  int permType;

  WlTree(
      {this.userId,
      this.permRoleName,
      this.permRoleId,
      this.permNodeId,
      this.permType});

  WlTree.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    permRoleName = json['permRoleName'];
    permRoleId = json['permRoleId'];
    permNodeId = json['permNodeId'];
    permType = json['permType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['permRoleName'] = this.permRoleName;
    data['permRoleId'] = this.permRoleId;
    data['permNodeId'] = this.permNodeId;
    data['permType'] = this.permType;
    return data;
  }
}

class AuthInfo {
  String mobile;
  int userId;
  String uuid;

  AuthInfo({this.mobile, this.userId, this.uuid});

  AuthInfo.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    userId = json['userId'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['userId'] = this.userId;
    data['uuid'] = this.uuid;
    return data;
  }
}