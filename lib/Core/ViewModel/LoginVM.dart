import 'package:flutter/widgets.dart';
import 'package:fluttertest/Core/Service/Auth.dart';
import '../../Helper/settingApp.dart';

class LoginViewModel extends BaseModel {
  AuthenticationService _authenticationService;

  LoginViewModel({
    @required AuthenticationService authenticationService,
  }) : _authenticationService = authenticationService;

  Future<bool> login(String userIdText,String password) async {
    setBusy(true);
    var success = await _authenticationService.login(userIdText,password);
    setBusy(false);
    return success;
  }
}
