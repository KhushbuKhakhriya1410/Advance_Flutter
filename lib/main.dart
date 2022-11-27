import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/planetinfo.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {

        '/': (context) => const homepage(),
        'planetinfo': (context) => const planetinfo(),
      },
    ),
  );
}