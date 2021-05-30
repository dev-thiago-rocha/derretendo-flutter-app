import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitanda_do_seu_joao/dashboard_screen.dart';
import 'package:quitanda_do_seu_joao/register_screen.dart';
import 'blocs/user_bloc.dart';
import 'create_post.dart';
import 'initial_screen.dart';
import 'login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        routes: {
          '/': (context) => InitialScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/dashboard': (context) => DashboardScreen(),
          '/create-post': (context) => CreatePostScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
