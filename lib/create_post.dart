import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:quitanda_do_seu_joao/blocs/user_bloc.dart';
import 'constants/api_constants.dart' as ApiConstants;
import 'models/user_model.dart';

final TextEditingController titleController = TextEditingController();
final TextEditingController descriptionController = TextEditingController();
final TextEditingController linkController = TextEditingController();
final TextEditingController priceController = TextEditingController();
final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

class CreatePostScreen extends StatelessWidget {
  createPost(String title, String description, String link, String price,
      UserBloc userBloc, context) async {
    String url = ApiConstants.API_URL + '/api/v1/post';
    String userHash = userBloc.user.username + ':' + userBloc.user.password;
    String authorizationString = 'Basic ' + base64Encode(utf8.encode(userHash));

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Authorization': authorizationString,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'title': title,
        'description': description,
        'link': link,
        'price': double.parse(price.replaceAll(",", "."))
      }),
    );

    if (response.statusCode == 200) {
      Navigator.of(context).pushReplacementNamed('/dashboard');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alerta(context);
        },
      );
    }
  }

  alerta(context) {
    return AlertDialog(
      title: Text("Erro ao criar o post"),
      content: Text("Ocorreu um erro ao criar o post :("),
      actions: [
        TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  final logo = SizedBox(
      height: 100.0,
      child: Image.asset(
        "assets/logo.png",
        fit: BoxFit.contain,
      ));

  final titleField = TextField(
    obscureText: false,
    controller: titleController,
    style: style,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Título",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final descriptionField = TextField(
    obscureText: false,
    controller: descriptionController,
    style: style,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Descrição",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final linkField = TextField(
    obscureText: false,
    controller: linkController,
    style: style,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Link",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final priceField = TextField(
    obscureText: false,
    controller: priceController,
    keyboardType: TextInputType.number,
    style: style,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Preço",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  @override
  Widget build(BuildContext context) {
    final userBloc = Provider.of<UserBloc>(context);
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo,
          SizedBox(height: 35),
          SizedBox(width: 300, child: titleField),
          SizedBox(height: 10),
          SizedBox(width: 300, child: descriptionField),
          SizedBox(height: 10),
          SizedBox(width: 300, child: linkField),
          SizedBox(height: 10),
          SizedBox(width: 300, child: priceField),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/dashboard');
            },
            child: Text(
              'Voltar',
              style: style.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500, color: Colors.red),
            ),
          )
        ],
      ))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        tooltip: 'Criar',
        onPressed: () {
          createPost(titleController.text, descriptionController.text,
              linkController.text, priceController.text, userBloc, context);
        },
      ),
    );
  }
}
