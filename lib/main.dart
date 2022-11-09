import 'package:flutter/material.dart';
import 'screens/details_video_page.dart';
import 'screens/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
        "details_page": (context) => DetailVideoPage(),
      },
    ),
  );
}