class HomeBannerModel {
  String code;
  String msg;
  List<HomeBannerData> data;
  String result;

  HomeBannerModel({this.code, this.msg, this.data, this.result});

  HomeBannerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<HomeBannerData>();
      json['data'].forEach((v) {
        data.add(new HomeBannerData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class HomeBannerData {
  String imgUrl;
  String newsUrl;
  int isAppTitle;
  String newsTitle;

  HomeBannerData({this.imgUrl, this.newsUrl, this.isAppTitle, this.newsTitle});

  HomeBannerData.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    newsUrl = json['newsUrl'];
    isAppTitle = json['isAppTitle'];
    newsTitle = json['newsTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgUrl'] = this.imgUrl;
    data['newsUrl'] = this.newsUrl;
    data['isAppTitle'] = this.isAppTitle;
    data['newsTitle'] = this.newsTitle;
    return data;
  }
}