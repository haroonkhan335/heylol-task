import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class LoginStore extends _LoginStore with _$LoginStore {}

abstract class _LoginStore extends Store {

  String email, password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @observable
  //TODO
  
   @observable

  @action
  //TODO

}