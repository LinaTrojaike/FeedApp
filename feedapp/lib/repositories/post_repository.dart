import 'package:dio/dio.dart';
import '../models/post_model.dart';

class PostRepository {
  Future<List<PostModel>> getAll() async {
    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');

      return (response.data as List)
          .map((post) => PostModel.fromJson(post))
          .toList();
    } catch (e) {
      throw e;
    }
  }
}
