import 'package:flutter_modular/flutter_modular.dart';

import 'functions/firebase_functions.dart';
import 'presentation/auth/index.dart';
import 'presentation/sign_in/index.dart';
import 'presentation/sign_up/sign_up.dart';

class AuthModule extends ChildModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [Bind((i) => FirebaseFunctions())];

  @override
  // TODO: implement routers
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AuthScreens()),
        Router('signUp', child: (_, args) => SignUp()),
        Router('signIn', child: (_, args) => SignIn())
      ];
}
