import 'package:mobile_application_practicum/pages/post_flutter/post_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class PostDetail extends StatelessWidget {
  final Post post;
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  PostDetail({required this.post});

  Future<void> deletePost(int id) async {
    var res = await http.delete(Uri.parse("$postsURL/$id"));

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Can't delete post.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await deletePost(post.id);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(title: Text("Title"), subtitle: Text(post.title)),
                    ListTile(title: Text("ID"), subtitle: Text("${post.id}")),
                    ListTile(title: Text("Body"), subtitle: Text(post.body)),
                    ListTile(
                      title: Text("User ID"),
                      subtitle: Text("${post.userId}"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
