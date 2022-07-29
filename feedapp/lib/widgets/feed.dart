import 'package:feedapp/post/details.post.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/post_model.dart';
import '../repositories/post_repository.dart';

class FeedHome extends StatefulWidget {
  @override
  _FeedHomeState createState() => _FeedHomeState();
}

final DatailsPost detailsPost = DatailsPost();

class _FeedHomeState extends State<FeedHome> {
  @override
  Widget build(BuildContext context) {
    final PostRepository postRepository = PostRepository();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FeedApp',
          style: GoogleFonts.lobster(fontSize: 28, color: Colors.white70),
        ),
      ),
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
            print(_post.id);
          }),
    );
  }
}
