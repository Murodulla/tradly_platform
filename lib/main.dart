import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/constants.dart';
import 'providers/main.dart';
import 'providers/login.dart';
import 'providers/onboard.dart';
import 'providers/signup.dart';
import 'ui/home/main_navigator_screen.dart';
import 'ui/login/login_screen.dart';
import 'ui/onboard_screen.dart';
import 'ui/signup/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLaunched = prefs.getBool('is_launched') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OnboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MainProvider(),
        ),
      ],
      child: MyApp(isLaunched: isLaunched),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({required this.isLaunched, Key? key}) : super(key: key);

  final bool isLaunched;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        fontFamily: 'Montserrat',
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      title: 'Tradly Platform',
      routes: {
        '/home': (context) => const MainNavigatorScreen(),
        '/onboarding': (context) => const Onboard(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
      initialRoute: isLaunched ? '/login' : '/onboarding',
    );
  }
}
