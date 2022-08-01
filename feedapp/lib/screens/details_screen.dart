import 'package:feedapp/models/commets_model.dart';
import 'package:feedapp/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/appbar_component.dart';
import '../repositories/post_repository.dart';

class DetailsPostScreen extends StatelessWidget {
  static const routeName = '/details-post';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final PostRepository postRepository = PostRepository();

    final postId = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: FeedAppBar(),
      body: FutureBuilder<PostModel>(
          future: postRepository.getPostById(postId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              PostModel? post = snapshot.data;
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        post!.title.toString(),
                        style: GoogleFonts.notoSerifGeorgian(
                            fontSize: mediaQuery.textScaleFactor * 26,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Text(
                          post.body.toString(),
                          style: GoogleFonts.notoSerifGeorgian(
                              fontSize: mediaQuery.textScaleFactor * 16,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Comentários",
                        style: GoogleFonts.notoSerifGeorgian(
                            fontSize: mediaQuery.textScaleFactor * 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<CommentsModel>>(
                        future: postRepository.getDetailsByPostId(postId),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<CommentsModel>? comments = snapshot.data;
                            return ListView.builder(
                                itemCount: comments?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CommentTile(comments![index]);
                                });
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    )
                  ]);
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}

class CommentTile extends StatelessWidget {
  final CommentsModel _comment;

  CommentTile(this._comment);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_comment.name.toString()),
        subtitle: Text(_comment.body.toString()),
      ),
    );
  }
}
