import 'package:flutter/material.dart';
import 'package:heyloltask/Home/home.dart';

import 'presentation/sign_in/index.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    // if (getCurrentUser() == null) {
    //   setState(() {
    //     isAuth = false;
    //   });
    // } else if (getCurrentUser() != null) {
    //   setState(() {
    //     isAuth = true;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? Home() : SignIn();
  }
}
