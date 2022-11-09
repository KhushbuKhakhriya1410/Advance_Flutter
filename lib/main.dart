import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'screens/photos.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'homepage',
      routes: {
        'homepage': (context) => const HomePage(),
        'photos_page': (context) => const PhotosPage(),
      },
    ),
  );
}