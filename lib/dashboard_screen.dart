import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quitanda_do_seu_joao/account_screen.dart';
import 'package:quitanda_do_seu_joao/offer_screen.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: _titulos[telaAtual],
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
