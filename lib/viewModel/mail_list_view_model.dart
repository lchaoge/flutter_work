import 'package:flutter/material.dart';
import 'package:flutter_work/dao/mail_list_dao.dart';
import 'package:flutter_work/model/mail_list_model.dart';
import 'package:provide/provide.dart';
import 'package:flutter_work/provide/mail_list_provide.dart';

class MailListViewModel {
  static Future getSearchAddrOrgList(BuildContext context, String orgCode) async {
    await MailListDao.selectSearchAddrOrgList(context, orgCode).then((res) {
      if (res != null) {
        MailListModel mailListModel = MailListModel.fromJson(res);
        Provide.value<MailListProvide>(context).setMailList(mailListModel);
      }
    });
  }
}