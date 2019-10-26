import 'dart:async';
import 'package:fluttertest/Core/Model/user.dart';

import 'Api.dart';

class AuthenticationService {
  final Api _api;

  AuthenticationService({Api api}) : _api = api;

  StreamController<User> _userController = StreamController<User>();

  Stream<User> get user => _userController.stream;

  Future<bool> login(String email,String password) async {
    var fetchedUser = await _api.getUserProfile(email,password);
    var hasUser = fetchedUser != null;
    if (hasUser) {
      _userController.add(fetchedUser);
    }

    return hasUser;
  }
}
