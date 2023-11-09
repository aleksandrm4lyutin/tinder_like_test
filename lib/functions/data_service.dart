import 'dart:convert';
import 'package:http/http.dart' as http;
import '../abstracts/class_post.dart';


class DataService {

  static const _postsUrl = 'https://jsonplaceholder.org/posts';

  Future<List<Post>?> getAllPosts() async {
    final response = await http.get(Uri.parse(_postsUrl));
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body) as List<dynamic>;
      try {
        List<Post> posts = _convertPosts(list);
        return posts;
      } catch(e) {
        print(e);
        throw Exception('Failed to convert data');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<Post> _convertPosts(List<dynamic> postMaps) {
    List<Post> posts = [];
    for(var post in postMaps) {
      posts.add(
        Post(
          id: post['id'] as int,
          slug: post['slug'] as String,
          url: post['url'] as String,
          title: post['title'] as String,
          content: post['content'] as String,
          image: post['image'] as String,
          thumbnail: post['thumbnail'] as String,
          status: post['status'] as String,
          category: post['category'] as String,
          publishedAt: post['publishedAt'] as String,
          updatedAt: post['updatedAt'] as String,
        )
      );
    }
    return posts;
  }

}
