import 'package:flutter/material.dart';
import '../components/appbar_component.dart';
import '../models/post_model.dart';
import '../repositories/post_repository.dart';
import 'details_screen.dart';

class FeedHomeScreen extends StatefulWidget {
  static const routeName = '/feed';

  @override
  _FeedHomeScreenState createState() => _FeedHomeScreenState();
}

class _FeedHomeScreenState extends State<FeedHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final PostRepository postRepository = PostRepository();

    return Scaffold(
      appBar: FeedAppBar(),
      body: FutureBuilder<List<PostModel>>(
        future: postRepository.getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PostModel>? posts = snapshot.data;
            return ListView.builder(
                itemCount: posts?.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostTile(posts![index]);
                });
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

class PostTile extends StatelessWidget {
  final PostModel _post;

  PostTile(this._post);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(_post.title.toString()),
          subtitle: Text(_post.body.toString()),
          onTap: () {
            Navigator.of(context)
                .pushNamed(DetailsPostScreen.routeName, arguments: _post.id);
          }),
    );
  }
}
