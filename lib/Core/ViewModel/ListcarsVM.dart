import 'package:fluttertest/Core/Model/listcar.dart';
import 'package:fluttertest/Core/Service/Api.dart';
import 'package:meta/meta.dart';
import 'package:flutter/widgets.dart';
import '../../Helper/settingApp.dart';

class ListCarsVM extends BaseModel {
  Api _api;

  ListCarsVM({
    @required Api api,
  }) : _api = api;

  List<ListCars> posts;

  Future getPosts() async {
    setBusy(true);
    posts = await _api.getPostsForUser();
    setBusy(false);
  }
}
