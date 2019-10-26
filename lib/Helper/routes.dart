import 'package:fluttertest/UI/Home/IndexHome.dart';

import 'settingApp.dart';
class FluroRouter {
  static Router router = Router();  
  static Handler _loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => LoginIndex());  
  static Handler _homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => HomeIndex());  

  static void setupRouter() {
    router.define(
      'login',
      handler: _loginHandler,
    );
    router.define(
      'home',
      handler: _homeHandler,
    );
  }
}