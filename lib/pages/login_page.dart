import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_work/common/style/style.dart';

/**
 * 登录
 */
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            _logo(),
            LoginForm(),
          ],
        )
      ),
    );
  }
  
  // logo
  Widget _logo(){
    return Container(
      width: ScreenUtil().setWidth(100),
      height: ScreenUtil().setHeight(100),
      child: Image.network(WMIcons.IMAGE_LOGO),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final registerFormKey = GlobalKey<FormState>();

  String mobile, smsCode;
  bool autovalidate = false;

  void _submitLoginForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('login...'),
        )
      );

    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String _validateUsername(value) {
    if (value.isEmpty) {
      return 'username is required';
    }
    return null;
  }

  String _validatePassword(value) {
    if (value.isEmpty) {
      return 'smsCode is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'username',
              helperText: '',
            ),
            onSaved: (value) {
              mobile = value;
            },
            validator: _validateUsername,
            autovalidate: autovalidate,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'smsCode',
              helperText: '',
            ),
            onSaved: (value) {
              smsCode = value;
            },
            validator: _validatePassword,
            autovalidate: autovalidate,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('登 录', style: TextStyle(color: Colors.white)),
                elevation: 0.0,
                onPressed: _submitLoginForm),
          )
        ],
      ),
    );
  }
}
