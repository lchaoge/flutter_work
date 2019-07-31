import 'package:flutter/material.dart';
import 'package:flutter_work/model/member_model.dart';

class MemberProvide with ChangeNotifier{
  MemberModel memberModel = new MemberModel();
  
  setMember(MemberModel member){
    memberModel = member;
    notifyListeners();
  }

  setHeadImgUrl(String headImgUrl){
    memberModel.data.headImgUrl = headImgUrl;
    notifyListeners();
  }

}