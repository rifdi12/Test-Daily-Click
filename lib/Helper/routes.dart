import 'package:fluttertest/UI/Home/AddProduct.dart';
import 'package:fluttertest/UI/Home/EditProduct.dart';
import 'package:fluttertest/UI/Home/FocusEmployee.dart';

import '../UI/Home/IndexHome.dart';
import 'settingApp.dart';

class FluroRouter {
  static Router router = Router();
  static Handler _homeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          HomeIndex());
  static Handler _createHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          AddEmployee());
  static Handler _editHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          EditProduct(id: params['id'][0],nama: params['nama'][0],umur: params['umur'][0],gaji: params['salary'][0]));

  static Handler _focusHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          FocusEmployee(id: params['id'][0]));

  static void setupRouter() {
    router.define(
      'home',
      handler: _homeHandler,
    );

    router.define(
      'focusemployee/:id',
      handler: _focusHandler,
    );

    router.define(
      'edit/:id/:nama/:umur/:salary',
      handler: _editHandler,
    );
    router.define(
      'create',
      handler: _createHandler,
    );
  }
}
