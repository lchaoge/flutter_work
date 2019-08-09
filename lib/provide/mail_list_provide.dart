import 'package:flutter/material.dart';
import 'package:flutter_work/model/mail_list_model.dart';

class MailListProvide with ChangeNotifier {
  MailListModel mailListModel = new MailListModel();

  setMailList(MailListModel mailList){
    mailListModel = mailList;
    notifyListeners();
  }

}