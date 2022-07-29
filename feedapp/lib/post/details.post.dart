import 'package:mobx/mobx.dart';
import 'package:feedapp/models/post_model.dart';
part 'details.post.g.dart';

// ignore: library_private_types_in_public_api
class DatailsPost = _DatailsPost with _$DatailsPost;

abstract class _DatailsPost with Store {
  @observable
  PostModel postSelected = PostModel();

  @action
  void selectPost(PostModel post) {
    postSelected = post;
  }

  @action
  void backToList(PostModel post) {
    postSelected = PostModel();
  }
}
