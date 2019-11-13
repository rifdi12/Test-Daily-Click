
import 'package:fluttertest/Core/Model/FocusEmploye.dart';
import 'package:fluttertest/Core/Service/Api.dart';
import 'package:meta/meta.dart';
import 'package:flutter/widgets.dart';
import '../../Helper/settingApp.dart';

class FocusEmployeVM extends BaseModel {
  Api _api;
  String id;
  FocusEmployeVM( {this.id,
    @required Api api,
  }) : _api = api;

  FocusEmploye posts;

  Future getPosts() async {
    print(id);
    setBusy(true);
    posts = await _api.focusEmployer(id);
    setBusy(false);
  }
}
