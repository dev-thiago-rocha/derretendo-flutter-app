import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitanda_do_seu_joao/blocs/user_bloc.dart';
import 'package:quitanda_do_seu_joao/models/post_model.dart';
import 'package:quitanda_do_seu_joao/post_container.dart';
import 'constants/api_constants.dart' as ApiConstants;
import 'package:http/http.dart' as http;

final TextStyle style = TextStyle(
    fontFamily: 'Montserrat', fontSize: 16.0, fontWeight: FontWeight.w500);

class OfferScreen extends StatefulWidget {
  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  List<PostModel> posts = [];

  fetchPosts(UserBloc userBloc) async {
    var url = ApiConstants.API_URL + '/api/v1/post';
    String userHash = userBloc.user.username + ':' + userBloc.user.password;
    String authorizationString = 'Basic ' + base64Encode(utf8.encode(userHash));

    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Authorization': authorizationString,
        'Content-Type': 'application/json',
      },
    );
    var decode = jsonDecode(response.body);

    List<PostModel> postsResponse =
        (decode as List).map((data) => new PostModel.fromJson(data)).toList();

    setState(() {
      posts = postsResponse;
    });
  }

  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      var userBloc = Provider.of<UserBloc>(context, listen: false);
      fetchPosts(userBloc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 1, top: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/create-post');
            },
            child: Center(
                child: Text(
              'Criar post',
              style: style,
            )),
          ),
        ),
        for (PostModel post in posts)
          if (post.title != null) PostContainer(post),
      ]),
    );
  }
}
