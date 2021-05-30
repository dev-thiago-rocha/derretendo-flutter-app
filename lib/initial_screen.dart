import 'package:flutter/material.dart';

final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

class InitialScreen extends StatelessWidget {
  final logo = SizedBox(
      height: 150.0,
      child: Image.asset(
        "assets/logo.png",
        fit: BoxFit.contain,
      ));

  final title = Text(
    'Derretendo !',
    style: TextStyle(
        fontSize: 24,
        color: Colors.red,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500),
  );

  final subtitle = Text(
    'As melhores ofertas 24h por dia',
    style: TextStyle(
        fontSize: 18,
        color: Colors.red,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400),
  );

  registerButon(context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: 320,
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/register');
        },
        child: Text("Cadastrar",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  loginButton(context) {
    return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(Colors.greenAccent.value),
        child: MaterialButton(
          minWidth: 320,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/login');
          },
          child: Text("Já possuo uma conta",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo,
          title,
          subtitle,
          SizedBox(
            height: 45,
          ),
          registerButon(context),
          SizedBox(
            height: 10,
          ),
          loginButton(context)
        ],
      ))),
    );
  }
}
