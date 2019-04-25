import 'package:flutter/material.dart';

/// 待办子页面-审批
class ProxyPageApproval extends StatefulWidget {
  @override
  _ProxyPageApprovalState createState() => _ProxyPageApprovalState();
}

class _ProxyPageApprovalState extends State<ProxyPageApproval> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Center(child:Text('审批中心')),
      ),
    );
  }
}