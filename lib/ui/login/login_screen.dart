import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../config/size_config.dart';
import '../../providers/login.dart';
import '../components/main_button.dart';
import '../components/main_text_button.dart';
import '../components/rich_text_button.dart';
import '../components/text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to Tradly',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Login to your account',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextFieldWidget(title: 'Email/Phone Number'),
                  const SizedBox(height: 10),
                  const TextFieldWidget(
                    title: 'Password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  MainButton(
                    title: 'Login',
                    eventHandler: () =>
                        context.read<LoginProvider>().goHomePage(context),
                  ),
                  const SizedBox(height: 10),
                  const MainTextButton(title: 'Forgot your password?'),
                  const SizedBox(height: 20),
                  RichTextButton(
                    primaryTitle: "Don't have an account? ",
                    secondaryTitle: 'Sign up',
                    eventHandler: () =>
                        context.read<LoginProvider>().goSignUpPage(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
