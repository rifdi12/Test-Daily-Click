import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertest/Core/Model/FocusEmploye.dart';
import 'package:fluttertest/Core/Model/Product.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  void sukses(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              color: Colors.green,
              child: Text('Sukses'),
            ),
          );
        });
  }

  void gagal(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(color: Colors.red, child: Text('gagal')),
          );
        });
  }

  static const link = 'http://dummy.restapiexample.com/api/v1';
  var client = new http.Client();

  createemploye(nama, salary, umur, context) async {
    var body =
        jsonEncode({"name": "$nama", "salary": "$salary", "age": "$umur"});
    var response = await client.post('$link/create', body: body);

    print(response.hashCode);
    if (jsonDecode(response.body)['name'] != null) {
      Navigator.pushReplacementNamed(context, 'home');
      sukses(context);
    } else {
      gagal(context);
    }
  }

  editemploye(id, nama, salary, umur, context) async {
    var body =
        jsonEncode({"name": "$nama", "salary": "$salary", "age": "$umur"});
    var response = await client.put(
      '$link/update/$id',
      body: body,
    );
    print(response.hashCode);
    if (jsonDecode(response.body)['name'] != null) {
      Navigator.pushReplacementNamed(context, 'home');
      sukses(context);
    } else {
      gagal(context);
    }
  }

  Future<List<ListProduct>> getPostsForUser() async {
    var posts = List<ListProduct>();
    var response = await client.get('$link/employees');
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var post in parsed) {
      posts.add(ListProduct.fromJson(post));
    }
    return posts;
  }

  Future<FocusEmploye> focusEmployer(String postId) async {
    var response = await client.get('$link/employee/$postId');
    return FocusEmploye.fromJson(json.decode(response.body));
  }

  delete(String postId, context) async {
    var response = await client.delete('$link/delete/$postId');
    print(response.body);
    Navigator.pushReplacementNamed(context, 'home');
  }
}
