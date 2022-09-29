import 'package:flutter/material.dart';
import 'routes/approutes.dart';
import 'routes/routesstring.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: settingpage,
      //initialRoute: cupertinoroute
      //initialRoute: whatsapppage,
      //initialRoute: stepperScreen2,
     initialRoute: playstoreapp,

      routes: approutes,
     //initialRoute: registration2,

    );
  }
}
