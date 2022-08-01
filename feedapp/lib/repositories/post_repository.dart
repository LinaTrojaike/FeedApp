import 'package:dio/dio.dart';
import 'package:feedapp/models/commets_model.dart';
import 'package:feedapp/models/user_model.dart';
import '../models/post_model.dart';

class PostRepository {
  Future<List<PostModel>> getAll() async {
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');

    return (response.data as List)
        .map((post) => PostModel.fromJson(post))
        .toList();
  }

  Future<PostModel> getPostById(int id) async {
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts/$id');

    return PostModel.fromJson(response.data);
  }

  Future<List<CommentsModel>> getDetailsByPostId(int postId) async {
    final response = await Dio()
        .get('https://jsonplaceholder.typicode.com/posts/$postId/comments');

    return (response.data as List)
        .map((post) => CommentsModel.fromJson(post))
        .toList();
  }

  Future<UserModel> getUserById(int id) async {
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/users/$id');

    return UserModel.fromJson(response.data);
  }
}
//extração de dados da api. conexão entre o aplicativo e a api/banco de dados. "**Model" representação das entidades que estão no banco de dados/api"