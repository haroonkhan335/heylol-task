import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:heyloltask/Authentication/presentation/sign_in/index.dart';
import 'package:heyloltask/Home/home.dart';

import 'controller.dart';

AuthenticationStore store = AuthenticationStore();

class AuthScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return store.getCurrentUser() == null ? SignIn() : Home();
      },
    );
  }
}
