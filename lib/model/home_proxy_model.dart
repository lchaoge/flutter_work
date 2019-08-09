class HomeProxyModel {
  String code;
  String msg;
  String ver;
  HomeProxyData data;

  HomeProxyModel({this.code, this.msg, this.ver, this.data});

  HomeProxyModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    ver = json['ver'];
    data = json['data'] != null ? new HomeProxyData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['ver'] = this.ver;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class HomeProxyData {
  int todoCount;
  int todoUpgradeCount;
  int urgeCount;
  int urgeUpgradeCount;
  List<CateList> cateList;

  HomeProxyData(
      {this.todoCount,
      this.todoUpgradeCount,
      this.urgeCount,
      this.urgeUpgradeCount,
      this.cateList});

  HomeProxyData.fromJson(Map<String, dynamic> json) {
    todoCount = json['todoCount'];
    todoUpgradeCount = json['todoUpgradeCount'];
    urgeCount = json['urgeCount'];
    urgeUpgradeCount = json['urgeUpgradeCount'];
    if (json['cateList'] != null) {
      cateList = new List<CateList>();
      json['cateList'].forEach((v) {
        cateList.add(new CateList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['todoCount'] = this.todoCount;
    data['todoUpgradeCount'] = this.todoUpgradeCount;
    data['urgeCount'] = this.urgeCount;
    data['urgeUpgradeCount'] = this.urgeUpgradeCount;
    if (this.cateList != null) {
      data['cateList'] = this.cateList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CateList {
  int taskCategory;
  String taskCategoryName;
  int totalCount;
  int upgradeCount;

  CateList(
      {this.taskCategory,
      this.taskCategoryName,
      this.totalCount,
      this.upgradeCount});

  CateList.fromJson(Map<String, dynamic> json) {
    taskCategory = json['taskCategory'];
    taskCategoryName = json['taskCategoryName'];
    totalCount = json['totalCount'];
    upgradeCount = json['upgradeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskCategory'] = this.taskCategory;
    data['taskCategoryName'] = this.taskCategoryName;
    data['totalCount'] = this.totalCount;
    data['upgradeCount'] = this.upgradeCount;
    return data;
  }
}