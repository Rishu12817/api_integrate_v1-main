import '../models/post.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,

      // Then parse the JSON.
      var json = response.body;

      return postFromJson(json);
      // the method postFromJson(String str) is defined in post.dart and the method postFromJson(String str + " ") is defined in post.dart 
    }
  }
}
