import 'package:app/providers/user-provider.dart';
import 'package:app/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomMenu extends StatefulWidget {
  static const String routeName = "/home";
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    PageController screenController = 'home';
    return Scaffold(
        body: PageView(
      controller: screenController,
      children: [
        HomeScreen(),
      ],
    ));
  }
}
