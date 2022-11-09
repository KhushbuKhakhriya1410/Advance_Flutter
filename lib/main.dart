import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/homepage.dart';
import 'screens/inro_screen.dart';
import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  bool? isIntroVisited = prefs.getBool('isIntroVisited') ?? false;

  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.amber,
        ),
      ),

      initialRoute:

      (isLoggedIn == false) ? '/login' : '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LogInPage(),
        '/intro_screen': (context) => IntroScreen(),
      },
    ),
  );
}