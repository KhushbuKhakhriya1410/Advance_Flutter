import 'package:flutter/material.dart';
import 'dart:math';
import 'package:galaxyplanet/global.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Galaxy Planets",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...Global.planets
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('planetinfo', arguments: e);
                    },
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Card(
                          color: Colors.black54,
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(left: 70),
                            margin: const EdgeInsets.only(
                                left: 100, bottom: 20, top: 20, right: 10),
                            height: 170,
                            width: 370,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 25),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e['planets'],
                                      style: const TextStyle(
                                        fontSize: 40,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Milkyway Galaxy",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        color: Colors.grey),
                                    const SizedBox(width: 5),
                                    Text(
                                      e['km'],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(Icons.unfold_less,
                                        color: Colors.grey),
                                    const SizedBox(height: 5),
                                    Text(
                                      e['m/s'],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        RotationTransition(
                          turns: animationController,
                          child: Hero(
                            tag: e['tag'],
                            child: Container(
                              height: 150,
                              width: 150,
                              margin: const EdgeInsets.all(10),
                              child: Image.asset(
                                e['images'],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
