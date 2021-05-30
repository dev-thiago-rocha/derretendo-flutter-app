import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/user_bloc.dart';

final TextStyle style = TextStyle(
    fontFamily: 'Montserrat', fontSize: 16.0, fontWeight: FontWeight.w500);

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    var userBloc = Provider.of<UserBloc>(context, listen: false);

    return Material(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.supervisor_account_outlined,
            size: 50,
          ),
          Text(
            userBloc.user.username,
            style: style,
          ),
          Text(
            userBloc.user.username + "@derretendo.com",
            style: style,
          )
        ],
      )),
    );
  }
}
