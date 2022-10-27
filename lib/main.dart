import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mirror_wall/screens/eduational/educationalpage.dart';
import 'package:mirror_wall/screens/eduational/clever.dart';
import 'package:mirror_wall/screens/eduational/javatpoint.dart';
import 'package:mirror_wall/screens/eduational/seesaw.dart';
import 'package:mirror_wall/screens/eduational/tutorailspoint.dart';
import 'package:mirror_wall/screens/eduational/w3school.dart';
import 'package:mirror_wall/screens/eduational/wikipedia.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash_screen',
    routes: {
      '/': (context) => const educational_page(),
      'w3school': (conntext) => const W3School_Page(),
      'javatpoint': (context) => const JavaTpoint_Page(),
      'wikipedia': (context) => const WikiPedia_Page(),
      'clever': (context) => const Clever_Page(),
      'seesaw': (context) => const Seesaw_Page(),
      'tutorailspoint': (context) => const Tutorialspoint_Page(),
      'splash_screen': (context) => const SplashScreenPage(),
    },
  ));
}
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Duration duration = const Duration(seconds: 3);
    Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: _heigth,
        width: _width,
        color: Colors.black,
        // color: const Color(0xff2b3e4f),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/web-education-logo.png",
              scale: 1.8,
              color: Colors.tealAccent.withOpacity(0.5),
            ),
            const SizedBox(height: 30),
            CircularProgressIndicator(
              backgroundColor: Colors.tealAccent.withOpacity(0.5),
              strokeWidth: 1.3,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}