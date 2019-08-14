class HomeReportModel {
  String code;
  String msg;
  HomeReportData data;
  String result;

  HomeReportModel({this.code, this.msg, this.data, this.result});

  HomeReportModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new HomeReportData.fromJson(json['data']) : null;
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

class HomeReportData {
  String week;
  String day;
  String lunar;
  String weather;
  String saleamt;
  String saleamtRate;
  String compasaleamtrate;
  String cnt;
  String rofit;
  String profitratio;

  HomeReportData(
      {this.week,
      this.day,
      this.lunar,
      this.weather,
      this.saleamt,
      this.saleamtRate,
      this.compasaleamtrate,
      this.cnt,
      this.rofit,
      this.profitratio});

  HomeReportData.fromJson(Map<String, dynamic> json) {
    week = json['week'];
    day = json['day'];
    lunar = json['lunar'];
    weather = json['weather'];
    saleamt = json['saleamt'];
    saleamtRate = json['saleamt_rate'];
    compasaleamtrate = json['compasaleamtrate'];
    cnt = json['cnt'];
    rofit = json['rofit'];
    profitratio = json['profitratio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['week'] = this.week;
    data['day'] = this.day;
    data['lunar'] = this.lunar;
    data['weather'] = this.weather;
    data['saleamt'] = this.saleamt;
    data['saleamt_rate'] = this.saleamtRate;
    data['compasaleamtrate'] = this.compasaleamtrate;
    data['cnt'] = this.cnt;
    data['rofit'] = this.rofit;
    data['profitratio'] = this.profitratio;
    return data;
  }
}