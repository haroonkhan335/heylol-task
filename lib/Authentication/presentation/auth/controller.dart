import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:heyloltask/Authentication/functions/firebase_functions.dart';
import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class AuthenticationStore extends _AuthenticationStore
    with _$AuthenticationStore {}

abstract class _AuthenticationStore extends Store {
  final fbDatabase = Modular.get<FirebaseFunctions>();

  @observable
  FirebaseUser currentUser;

  // @observable
  // bool isLogged;

  @action
  getCurrentUser() {
    currentUser = fbDatabase.getCurrentUser();
    return currentUser;
  }

  // @action
  // void checkUserLogin() {
  //   if (currentUser == null) {
  //     isLogged = false;
  //   } else {
  //     isLogged = true;
  //   }
  // }
}
