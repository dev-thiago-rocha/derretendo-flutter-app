import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/api_constants.dart' as ApiConstants;
import 'package:http/http.dart' as http;

import 'blocs/user_bloc.dart';
import 'models/user_model.dart';

final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

class LoginScreen extends StatelessWidget {
  loginUser(username, password, context) async {
    var url = ApiConstants.API_URL + '/api/v1/user/login';
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      final bloc = Provider.of<UserBloc>(context, listen: false);
      bloc.set(UserModel(username: username, password: password));
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
      title: Text("Erro ao Logar"),
      content: Text("Login invalido :("),
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

  final usernameField = TextField(
    obscureText: false,
    controller: usernameController,
    style: style,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Usuário",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final passwordField = TextField(
    obscureText: true,
    controller: passwordController,
    style: style,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Senha",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo,
          SizedBox(height: 35),
          SizedBox(width: 300, child: usernameField),
          SizedBox(height: 10),
          SizedBox(width: 300, child: passwordField),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/');
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
        tooltip: 'Logar',
        onPressed: () {
          loginUser(usernameController.text, passwordController.text, context);
        },
      ),
    );
  }
}
