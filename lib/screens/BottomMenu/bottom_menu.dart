import 'package:app/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../Transactions/transactions_screen.dart';

class BottomMenu extends StatefulWidget {
  static const String routeName = "/bottom-menu";
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int currentScreen = 0;
  late PageController screenController;

  @override
  void initState() {
    super.initState();
    screenController = PageController(initialPage: currentScreen);
  }

  setCurrentScreen(screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: screenController,
        onPageChanged: setCurrentScreen,
        children: const [
          HomeScreen(),
          TransactionsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreen,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.attach_money_outlined,
              ),
              label: "Transações"),
        ],
        onTap: (screen) {
          screenController.animateToPage(
            screen,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.ease,
          );
        },
        backgroundColor: whiteColor,
      ),
    );
  }
}
