import 'dart:convert';

import 'package:http_flutter_app/models/post.dart';
import 'package:http/http.dart';

class HttpService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> getPosts() async {
    Uri url = Uri.parse("$baseUrl/posts");
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<Post> posts = data
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }

  Future<void> deletePost(int? id) async {
    Uri url = Uri.parse("$baseUrl/posts/$id");
    Response response = await delete(url);

    if (response.statusCode == 200) {
      print("Deleted");
    } else {
      throw "Can't delete post.";
    }
  }
}
