import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quitanda_do_seu_joao/account_screen.dart';
import 'package:quitanda_do_seu_joao/offer_screen.dart';

import 'package:provider/provider.dart';
import 'package:quitanda_do_seu_joao/blocs/user_bloc.dart';

import 'models/user_model.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int telaAtual = 0;

  final List<Widget> _telas = [
    OfferScreen(),
    AccountScreen(),
  ];

  final List<Widget> _titulos = [
    Text('Ofertas 🔥'),
    Text('Minha Conta'),
  ];

  @override
  Widget build(BuildContext context) {
    final userBloc = Provider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: _titulos[telaAtual],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
                leading: Icon(Icons.person_outline_outlined),
                title: Text(userBloc.user.username),
                subtitle: Text(userBloc.user.username + "@derretendo.com")),
            TextButton(
                onPressed: () {
                  userBloc.set(UserModel());
                  Navigator.of(context).pushReplacementNamed('/');
                },
                child: Text('Sair'))
          ],
        ),
      ),
      body: _telas[telaAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: telaAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              label: 'Ofertas', icon: Icon(Icons.shopping_cart_outlined)),
          BottomNavigationBarItem(
              label: 'Minha conta', icon: Icon(Icons.account_box_outlined))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      telaAtual = index;
    });
  }
}
