
import 'package:fluttertest/Core/Model/Product.dart';
import 'package:fluttertest/Core/Service/Api.dart';
import 'package:meta/meta.dart';
import 'package:flutter/widgets.dart';
import '../../Helper/settingApp.dart';

class ListProductVM extends BaseModel {
  Api _api;

  ListProductVM({
    @required Api api,
  }) : _api = api;

  List<ListProduct> posts;

  Future getPosts() async {
    setBusy(true);
    posts = await _api.getPostsForUser();
    setBusy(false);
  }
}
