import 'package:flutter/material.dart';

/**
 * 首页索引状态
 * Created by chaoge
 * on 2019/7/25.
 */
class CurrentIndexProvide with ChangeNotifier {
  int currentIndex= 0;

  changeIndex(int index){
    currentIndex = index;
    notifyListeners();
  }
}