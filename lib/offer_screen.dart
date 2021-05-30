import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitanda_do_seu_joao/blocs/user_bloc.dart';
import 'constants/api_constants.dart' as ApiConstants;
import 'package:http/http.dart' as http;

final TextStyle style = TextStyle(
    fontFamily: 'Montserrat', fontSize: 16.0, fontWeight: FontWeight.w500);

class OfferScreen extends StatefulWidget {
  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  fetchPosts(UserBloc userBloc) async {
    var url = ApiConstants.API_URL + '/api/v1/post';
    String userHash = userBloc.user.username + ':' + userBloc.user.password;
    String authorizationString = 'Basic ' + base64Encode(utf8.encode(userHash));
    print(authorizationString);
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Authorization': authorizationString,
        'Content-Type': 'application/json',
      },
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = Provider.of<UserBloc>(context, listen: false);
    fetchPosts(userBloc);
    final postContainer = Container(
      height: 200,
      margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('titulo',
                style: style.copyWith(color: Colors.white, fontSize: 20)),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Criador',
                    style: style.copyWith(
                      color: Colors.white,
                    )),
                Text('Descrição',
                    style: style.copyWith(
                      color: Colors.white,
                    )),
                Text('Link',
                    style: style.copyWith(
                      color: Colors.white,
                    )),
                Text('Data',
                    style: style.copyWith(
                      color: Colors.white,
                    )),
                Text('Preço',
                    style: style.copyWith(
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ],
      ),
    );

    return Material(
      child: ListView(
        children: [
          postContainer,
          postContainer,
          postContainer,
          postContainer,
          postContainer,
          postContainer
        ],
      ),
    );
  }
}
