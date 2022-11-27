import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class bmical extends StatefulWidget {
  const bmical({Key? key}) : super(key: key);

  @override
  State<bmical> createState() => _bmicalState();
}

class _bmicalState extends State<bmical> with TickerProviderStateMixin {
  int age = 0;
  int weight = 0;
  var value = 1.0;
  double height = 0;
  double bmiTotal = 0;
  String health = "NORMAL WEIGHT";

  TextEditingController weigthController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  late AnimationController animationController;
  late Animation<Offset> femaleanimation;
  late Animation<Offset> maleanimation;
  late Animation<Offset> heightanimation;
  late Animation<Offset> weightanimation;
  late Animation<Offset> ageanimation;
  late Animation<Offset> calcanimation;
  late Animation<Offset> bmicalc_animation;

  @override
  void initState() {
    weigthController.text = weight.toString();
    ageController.text = age.toString();
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    heightanimation = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset.zero,
    ).animate(animationController);

    femaleanimation = Tween<Offset>(
      begin: Offset(-1, -1),
      end: Offset.zero,
    ).animate(animationController);

    maleanimation = Tween<Offset>(
      begin: const Offset(1, -1),
      end: Offset.zero,
    ).animate(animationController);

    weightanimation = Tween<Offset>(
      begin: const Offset(-1, 1),
      end: Offset.zero,
    ).animate(animationController);

    ageanimation = Tween<Offset>(
      begin: const Offset(1, 1),
      end: Offset.zero,
    ).animate(animationController);

    calcanimation = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset.zero,
    ).animate(animationController);

    bmicalc_animation = Tween<Offset>(
      begin: Offset(0, -5),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  SlideTransition(
                    position: bmicalc_animation,
                    child: Container(
                      alignment: Alignment.center,
                      height: 70,
                      //width: _width,
                      color: Color(0xFF1D1E33),
                      child: Text(
                        "BMI Calculator",
                        style: const TextStyle(
                            fontSize: 28,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: SlideTransition(
                            position: femaleanimation,
                            child: InkWell(
                              onTap: () {
                                Color colorPink1 = Colors.white;
                                Color colorPink2 = Color(0xFFB85B7E);
                                setState(() {});
                              },
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1D1E33),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.female,
                                      size: 150,
                                      color: Color(0xFFB85B7E),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Female",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: SlideTransition(
                            position: maleanimation,
                            child: InkWell(
                              onTap: () {
                                Color colorPink2 = Colors.white;
                                Color colorPink1 = Color(0xFFB85B7E);
                                setState(() {});
                              },
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1D1E33),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.male,
                                      size: 150,
                                      color: Color(0xFFB85B7E),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Male",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SlideTransition(
                    position: heightanimation,
                    child: Container(
                      height: 180,
                      width: 350,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "HEIGHT",
                            style: const TextStyle(color: Color(0xFF626473)),
                          ),
                          Hero(
                            tag: 'height',
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: value.toInt().toString(),
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                              const TextSpan(
                                  text: " cm",
                                  style: TextStyle(
                                      color: Color(0xFF626473),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15)),
                            ])),
                          ),
                          Container(
                            width: 400,
                            child: SliderTheme(
                              data: SliderThemeData(
                                  thumbColor: Color(0xFFB85B7E),
                                  trackHeight: 0.2,
                                  activeTrackColor:
                                      Color(0xfff5C1d1).withOpacity(0.5),
                                  inactiveTrackColor: Color(0xff555555)),
                              child: Slider(
                                  value: value,
                                  min: 1.0,
                                  max: 400.0,
                                  onChanged: (data) {
                                    value = data;
                                    // print(value);
                                    setState(() {});
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  ///last row
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: SlideTransition(
                            position: weightanimation,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 200,
                              decoration: BoxDecoration(
                                color: Color(0xFF1D1E33),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Weight",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                  Container(
                                    height: 80,
                                    child: TextField(
                                      onSubmitted: (data) {
                                        weight = int.parse(data);
                                      },
                                      controller: weigthController,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                      ),
                                      cursorColor: Color(0xFF090E21),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(3)
                                      ],
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            weight++;
                                            weigthController.text =
                                                weight.toString();
                                          });
                                        },
                                        child: const Icon(Icons.add),
                                        backgroundColor:
                                            const Color(0xFF4C4F5E),
                                        mini: true,
                                      ),
                                      FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            weight--;
                                            weigthController.text =
                                                weight.toString();
                                          });
                                        },
                                        child: const Icon(CupertinoIcons.minus),
                                        backgroundColor:
                                            const Color(0xFF4C4F5E),
                                        mini: true,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: SlideTransition(
                            position: ageanimation,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 200,
                              decoration: BoxDecoration(
                                color: Color(0xFF1D1E33),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // decoration: containDeco,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Age",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                  Container(
                                    height: 80,
                                    child: TextField(
                                      onSubmitted: (data) {
                                        age = int.parse(data);
                                      },
                                      controller: ageController,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                      ),
                                      cursorColor: Color(0xFF090E21),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(3),
                                      ],
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            age++;
                                            ageController.text = age.toString();
                                          });
                                        },
                                        child: const Icon(Icons.add),
                                        backgroundColor:
                                            const Color(0xFF4C4F5E),
                                        mini: true,
                                      ),
                                      FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            age--;
                                            ageController.text = age.toString();
                                          });
                                        },
                                        child: const Icon(CupertinoIcons.minus),
                                        backgroundColor:
                                            const Color(0xFF4C4F5E),
                                        mini: true,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  InkWell(
                    onTap: () {
                      height = (value / 100) * (value / 100);
                      bmiTotal = weight / height;
                      if (bmiTotal < 18.5) {
                        health = "Under Weight";
                      } else if (bmiTotal >= 18.5 && bmiTotal < 25) {
                        health = "Normal Weight";
                      } else if (bmiTotal >= 25 && bmiTotal < 30) {
                        health = "Over Weight";
                      } else {
                        health = "Obese";
                      }
                      _modalBottomSheetMenu();
                    },
                    child: SlideTransition(
                      position: calcanimation,
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xFF1D1E33),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Text(
                          "calculate",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        backgroundColor: Colors.black54,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(35),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "BMI",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 250,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Hero(
                          tag: 'bmiTotal',
                          child: Text(
                            bmiTotal.toDouble().toStringAsFixed(2).toString(),
                            style: TextStyle(
                                color: Color(0xffEB1555),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      health,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
