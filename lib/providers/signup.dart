import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  void goLoginPage(BuildContext context) {
    // Navigator.of(context).pushNamed('/login');
    Navigator.pop(context);
  }
}
