import 'package:flutter/material.dart';
import 'package:otp_plateform/globals.dart';

import '../globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "OTP Platforms ",
          style: TextStyle(fontSize: 22),
        ),
        leading: Image.asset(
          'assets/images/logo.jpg',
        ),
        centerTitle: true,
      ),
      body: Column(
          children: weblist
              .map((e) => Padding(
            padding: const EdgeInsets.only(
                top: 55, left: 30, right: 30, bottom: 0),
            child: Card(
              elevation: 2,
              color: e['color'],
              child: ListTile(
                title: Center(
                  child: Text(
                    e['name'],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(e['route']);
                },
              ),
            ),
          ))
              .toList()),
    );
  }
}