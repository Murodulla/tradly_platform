import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  void goSignUpPage(BuildContext context) {
    Navigator.of(context).pushNamed('/signup');
  }

  void goHomePage(BuildContext context) {
    Navigator.of(context).popAndPushNamed('/home');
  }
}
