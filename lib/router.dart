import 'package:app/screens/BottomMenu/bottom_menu.dart';
import 'package:app/screens/Home/home_screen.dart';
import 'package:app/screens/Login/login_screen.dart';
import 'package:app/screens/SignUp/signup_screen.dart';
import 'package:app/screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRouter(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case WelcomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const WelcomeScreen(),
      );
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case BottomMenu.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomMenu(),
        settings: routeSettings,
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Essa página não Existe'),
          ),
        ),
      );
  }
}
