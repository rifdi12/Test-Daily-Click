import 'dart:convert';

import 'package:fluttertest/Core/Model/listcar.dart';
import 'package:http/http.dart' as http;
import '../Model/user.dart';

/// The service responsible for networking requests
class Api {
  static const link = 'http://needmobildev.com/service/v2/';
  static const basic = 'Basic bmVtb2Itc2VydmVyLWtleS1ETEFrb0w3czgtTGFCNGxaMTU2TGVMRnU6bmVtb2Itd2ViLWpfeTdSUkZaSkVUSHNxTWU=';
  var client = new http.Client();

  Future<User> getUserProfile(String email, String password) async {
    // Get user profile for id
    var response = await client.post('$link/authentification/Login',
     body: {
        'email':email,
        'password':password
      },
     headers: {'Authorization':basic});
    // Convert and return
    
    print(json.decode(response.body)['code']);
    if(json.decode(response.body)['code'] !=400){
    return User.fromJson(json.decode(response.body));
    }else{
      return null;
    }
  }

  Future<List<ListCars>> getPostsForUser() async {
    var posts = List<ListCars>();
    // Get user posts for id
    var response = await client.get('$link/nemobrent/specialcar', headers: {'Authorization':basic});

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(ListCars.fromJson(post));
    }

    return posts;
  }

//   Future<List<Comment>> getCommentsForPost(int postId) async {
//     var comments = List<Comment>();

//     // Get comments for post
//     var response = await client.get('$endpoint/comments?postId=$postId');

//     // Parse into List
//     var parsed = json.decode(response.body) as List<dynamic>;
    
//     // Loop and convert each item to a Comment
//     for (var comment in parsed) {
//       comments.add(Comment.fromJson(comment));
//     }

//     return comments;
//   }
}
