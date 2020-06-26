import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:heyloltask/Authentication/auth_module.dart';

import '../main.dart';

class AppModule extends MainModule {
  final authModule = AuthModule();
  @override
  // TODO: implement binds
  List<Bind> get binds => [...authModule.binds];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => MaterialApp(
        onGenerateRoute: Modular.generateRoute,
        navigatorKey: Modular.navigatorKey,
        initialRoute: '/',
      );

  @override
  // TODO: implement routers
  List<Router> get routers => [Router('', module: AuthModule())];
}
