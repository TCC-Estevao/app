import 'package:app/providers/user-provider.dart';
import 'package:app/router.dart';
import 'package:app/screens/BottomMenu/bottom_menu.dart';
import 'package:app/screens/admin/admin_screen.dart';
import 'package:app/styles/colors.dart';
import 'package:app/screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => generateRouter(settings),
      debugShowCheckedModeBanner: false,
      title: 'Finance',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        buttonTheme: const ButtonThemeData(
          buttonColor: primaryColor,
        ),
        iconTheme: const IconThemeData(color: primaryColor),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: primaryColor,
          selectedItemColor: primaryColor,
        ),
      ),
      home: Provider.of<UserProvider>(context).user.accessToken.isNotEmpty
          ? Provider.of<UserProvider>(context).user.isAdmin
              ? const BottomMenu()
              : const AdminScreen()
          : const WelcomeScreen(),
    );
  }
}
