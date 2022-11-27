import 'package:flutter/material.dart';
import 'bmical.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const bmical(),
      },
    ),
  );
}