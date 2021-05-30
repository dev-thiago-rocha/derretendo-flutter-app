import 'package:flutter/material.dart';

final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

class LoginScreen extends StatelessWidget {
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
        onPressed: () {},
      ),
    );
  }
}
