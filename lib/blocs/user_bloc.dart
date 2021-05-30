import 'package:flutter/cupertino.dart';
import 'package:quitanda_do_seu_joao/models/user_model.dart';

class UserBloc extends ChangeNotifier {
  var user = new UserModel();

  get() {
    return user;
  }

  set(UserModel user) {
    this.user = user;
  }
}
