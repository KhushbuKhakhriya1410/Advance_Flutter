import 'package:flutter/material.dart';
import 'homepage.dart';

class planetinfo extends StatefulWidget {
  const planetinfo({Key? key}) : super(key: key);

  @override
  State<planetinfo> createState() => _planetinfoState();
}

class _planetinfoState extends State<planetinfo>
    with SingleTickerProviderStateMixin {
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
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Planet Information",
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.all(15),
                color: Colors.yellow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 170),
                    Text(
                      "${res['planets']}",
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Milkyway Gallaxy",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 20),
                        const Icon(Icons.location_on, color: Colors.grey),
                        const SizedBox(width: 5),
                        Text(
                          "${res['km']}",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        const Icon(Icons.unfold_less, color: Colors.grey),
                        const SizedBox(height: 5),
                        Text(
                          "${res['m/s']}",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
              RotationTransition(
                turns: animationController,
                child: Hero(
                  tag: "{$res['tag']}",
                  child: SizedBox(
                    height: 210,
                    width: 150,
                    child: Image.asset(
                      "${res['images']}",
                      // fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(15),
            color: Colors.black54,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                '''${res['detail']}''',
                style: const TextStyle(
                    color: Colors.white, wordSpacing: 2, fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
