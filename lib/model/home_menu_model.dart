class HomeMenuModel {
  String code;
  String msg;
  HomeMenuData data;
  String result;

  HomeMenuModel({this.code, this.msg, this.data, this.result});

  HomeMenuModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new HomeMenuData.fromJson(json['data']) : null;
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

class HomeMenuData {
  List<CgTree> cgTree;
  UserInfo userInfo;
  String faceUrl;
  String faceDomain;
  MenuInfo menuInfo;
  List<YyTree> yyTree;
  String myReportsUrl;
  List<WlTree> wlTree;
  String weatherInfo;
  List<CookieInfo> cookieInfo;
  int isShowReports;

  HomeMenuData(
      {this.cgTree,
      this.userInfo,
      this.faceUrl,
      this.faceDomain,
      this.menuInfo,
      this.yyTree,
      this.myReportsUrl,
      this.wlTree,
      this.weatherInfo,
      this.cookieInfo,
      this.isShowReports});

  HomeMenuData.fromJson(Map<String, dynamic> json) {
    if (json['cgTree'] != null) {
      cgTree = new List<CgTree>();
      json['cgTree'].forEach((v) {
        cgTree.add(new CgTree.fromJson(v));
      });
    }
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
    faceUrl = json['faceUrl'];
    faceDomain = json['faceDomain'];
    menuInfo = json['menuInfo'] != null
        ? new MenuInfo.fromJson(json['menuInfo'])
        : null;
    if (json['yyTree'] != null) {
      yyTree = new List<YyTree>();
      json['yyTree'].forEach((v) {
        yyTree.add(new YyTree.fromJson(v));
      });
    }
    myReportsUrl = json['myReportsUrl'];
    if (json['wlTree'] != null) {
      wlTree = new List<WlTree>();
      json['wlTree'].forEach((v) {
        wlTree.add(new WlTree.fromJson(v));
      });
    }
    weatherInfo = json['weatherInfo'];
    if (json['cookieInfo'] != null) {
      cookieInfo = new List<CookieInfo>();
      json['cookieInfo'].forEach((v) {
        cookieInfo.add(new CookieInfo.fromJson(v));
      });
    }
    isShowReports = json['isShowReports'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cgTree != null) {
      data['cgTree'] = this.cgTree.map((v) => v.toJson()).toList();
    }
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
    data['faceUrl'] = this.faceUrl;
    data['faceDomain'] = this.faceDomain;
    if (this.menuInfo != null) {
      data['menuInfo'] = this.menuInfo.toJson();
    }
    if (this.yyTree != null) {
      data['yyTree'] = this.yyTree.map((v) => v.toJson()).toList();
    }
    data['myReportsUrl'] = this.myReportsUrl;
    if (this.wlTree != null) {
      data['wlTree'] = this.wlTree.map((v) => v.toJson()).toList();
    }
    data['weatherInfo'] = this.weatherInfo;
    if (this.cookieInfo != null) {
      data['cookieInfo'] = this.cookieInfo.map((v) => v.toJson()).toList();
    }
    data['isShowReports'] = this.isShowReports;
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

class MenuInfo {
  String pid;
  String id;
  List<Cid> cid;

  MenuInfo({this.pid, this.id, this.cid});

  MenuInfo.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    id = json['id'];
    if (json['cid'] != null) {
      cid = new List<Cid>();
      json['cid'].forEach((v) {
        cid.add(new Cid.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['id'] = this.id;
    if (this.cid != null) {
      data['cid'] = this.cid.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cid {
  int isByCookie;
  String menuIcon;
  int sysId;
  int isOpenWeb;
  String menuName;
  String pid;
  int isSiteUse;
  int isLeaf;
  int isOa;
  String cookieDomain;
  int isAppTitle;
  String tlmenuIcon;
  String menuUrl;
  String id;
  int isJumpWeb;
  List<Cid> cid;

  Cid(
      {this.isByCookie,
      this.menuIcon,
      this.sysId,
      this.isOpenWeb,
      this.menuName,
      this.pid,
      this.isSiteUse,
      this.isLeaf,
      this.isOa,
      this.cookieDomain,
      this.isAppTitle,
      this.tlmenuIcon,
      this.menuUrl,
      this.id,
      this.isJumpWeb,
      this.cid});

  Cid.fromJson(Map<String, dynamic> json) {
    isByCookie = json['isByCookie'];
    menuIcon = json['menuIcon'];
    sysId = json['sysId'];
    isOpenWeb = json['isOpenWeb'];
    menuName = json['menuName'];
    pid = json['pid'];
    isSiteUse = json['isSiteUse'];
    isLeaf = json['isLeaf'];
    isOa = json['isOa'];
    cookieDomain = json['cookieDomain'];
    isAppTitle = json['isAppTitle'];
    tlmenuIcon = json['tlmenuIcon'];
    menuUrl = json['menuUrl'];
    id = json['id'];
    isJumpWeb = json['isJumpWeb'];
    if (json['cid'] != null) {
      cid = new List<Cid>();
      json['cid'].forEach((v) {
        cid.add(new Cid.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isByCookie'] = this.isByCookie;
    data['menuIcon'] = this.menuIcon;
    data['sysId'] = this.sysId;
    data['isOpenWeb'] = this.isOpenWeb;
    data['menuName'] = this.menuName;
    data['pid'] = this.pid;
    data['isSiteUse'] = this.isSiteUse;
    data['isLeaf'] = this.isLeaf;
    data['isOa'] = this.isOa;
    data['cookieDomain'] = this.cookieDomain;
    data['isAppTitle'] = this.isAppTitle;
    data['tlmenuIcon'] = this.tlmenuIcon;
    data['menuUrl'] = this.menuUrl;
    data['id'] = this.id;
    data['isJumpWeb'] = this.isJumpWeb;
    if (this.cid != null) {
      data['cid'] = this.cid.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CidChildren {
  int isByCookie;
  String menuIcon;
  int sysId;
  int isOpenWeb;
  String menuName;
  String pid;
  int isSiteUse;
  int isLeaf;
  int isOa;
  String cookieDomain;
  int isAppTitle;
  String tlmenuIcon;
  String menuUrl;
  String id;
  int isJumpWeb;

  CidChildren(
      {this.isByCookie,
      this.menuIcon,
      this.sysId,
      this.isOpenWeb,
      this.menuName,
      this.pid,
      this.isSiteUse,
      this.isLeaf,
      this.isOa,
      this.cookieDomain,
      this.isAppTitle,
      this.tlmenuIcon,
      this.menuUrl,
      this.id,
      this.isJumpWeb});

  CidChildren.fromJson(Map<String, dynamic> json) {
    isByCookie = json['isByCookie'];
    menuIcon = json['menuIcon'];
    sysId = json['sysId'];
    isOpenWeb = json['isOpenWeb'];
    menuName = json['menuName'];
    pid = json['pid'];
    isSiteUse = json['isSiteUse'];
    isLeaf = json['isLeaf'];
    isOa = json['isOa'];
    cookieDomain = json['cookieDomain'];
    isAppTitle = json['isAppTitle'];
    tlmenuIcon = json['tlmenuIcon'];
    menuUrl = json['menuUrl'];
    id = json['id'];
    isJumpWeb = json['isJumpWeb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isByCookie'] = this.isByCookie;
    data['menuIcon'] = this.menuIcon;
    data['sysId'] = this.sysId;
    data['isOpenWeb'] = this.isOpenWeb;
    data['menuName'] = this.menuName;
    data['pid'] = this.pid;
    data['isSiteUse'] = this.isSiteUse;
    data['isLeaf'] = this.isLeaf;
    data['isOa'] = this.isOa;
    data['cookieDomain'] = this.cookieDomain;
    data['isAppTitle'] = this.isAppTitle;
    data['tlmenuIcon'] = this.tlmenuIcon;
    data['menuUrl'] = this.menuUrl;
    data['id'] = this.id;
    data['isJumpWeb'] = this.isJumpWeb;
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

class CookieInfo {
  String domain;
  String value;
  String key;

  CookieInfo({this.domain, this.value, this.key});

  CookieInfo.fromJson(Map<String, dynamic> json) {
    domain = json['domain'];
    value = json['value'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['domain'] = this.domain;
    data['value'] = this.value;
    data['key'] = this.key;
    return data;
  }
}