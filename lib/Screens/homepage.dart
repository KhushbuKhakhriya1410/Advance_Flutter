import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky_scrapper_1/global.dart';
import 'package:sky_scrapper_1/main.dart';
import 'package:sky_scrapper_1/helpers/helper.dart';
import 'package:sky_scrapper_1/models/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<CurrencyConvert?> future;

  TextEditingController amtController = TextEditingController();

  TextStyle myStyle = const TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();
    future = CurrencyConvertAPI.weatherAPI
        .currencyConvertorAPI(from: "USD", to: "INR", amt: 1);
    amtController.text = "1";
  }

  String fromCurrency = "USD";
  String toCurrency = "INR";

  @override
  Widget build(BuildContext context) {
    return (Global.isAndroid == false)
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Currency Convertor",
                  style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.limeAccent,
              actions: [
                Switch(
                  inactiveThumbColor: Colors.black,
                  onChanged: (val) {
                    Global.isAndroid = val;
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const MyApp(),
                        ),
                        (route) => false);
                  },
                  value: Global.isAndroid,
                ),
              ],
            ),
            body: FutureBuilder(
              future: future,
              builder: (context, snapShot) {
                if (snapShot.hasError) {
                  return Center(
                    child: Text("${snapShot.error}"),
                  );
                } else if (snapShot.hasData) {
                  CurrencyConvert? data = snapShot.data as CurrencyConvert?;

                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          height: 290,
                          child: Image.asset(
                            "assets/images/img1.png",
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Enter Amount  :",
                              style: myStyle,
                            ),
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.limeAccent,
                                    contentPadding:
                                        const EdgeInsets.only(left: 20),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 3,
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  controller: amtController,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.limeAccent,
                            border: Border.all(color: Colors.black),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.black,
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "        From",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      DropdownButtonFormField(
                                        value: fromCurrency,
                                        onChanged: (val) {
                                          setState(() {
                                            fromCurrency = val!.toString();
                                          });
                                        },
                                        items: Global.currency.map((e) {
                                          return DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "         To",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      DropdownButtonFormField(
                                        value: toCurrency,
                                        onChanged: (val) {
                                          setState(() {
                                            toCurrency = val!.toString();
                                          });
                                        },
                                        items: Global.currency.map((e) {
                                          return DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            "Result  :  ${data!.difference}",
                            style: const TextStyle(
                              //color: Global.appColor,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.limeAccent,
                              shadowColor: Colors.black,
                              elevation: 25,
                              side: BorderSide(width: 1, color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              if (amtController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    //  backgroundColor: Global.appColor,
                                    behavior: SnackBarBehavior.floating,
                                    content: Text("Please Enter Amount"),
                                  ),
                                );
                              } else {
                                int amt = int.parse(amtController.text);
                                setState(() {
                                  future = CurrencyConvertAPI.weatherAPI
                                      .currencyConvertorAPI(
                                    from: fromCurrency,
                                    to: toCurrency,
                                    amt: amt,
                                  );
                                });
                              }
                            },
                            child: const Text(
                              "CONVERT",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        : CupertinoPageScaffold(
            backgroundColor: Colors.white,
            navigationBar: CupertinoNavigationBar(
              trailing: CupertinoSwitch(
                  activeColor: CupertinoColors.black.withOpacity(0.5),
                  onChanged: (val) {
                    Global.isAndroid = val;
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const MyApp(),
                        ),
                        (route) => false);
                  },
                  value: Global.isAndroid),
              backgroundColor: Colors.limeAccent,
              middle: const Text(
                "Currency Convertor",
                style: TextStyle(color: CupertinoColors.black, fontSize: 24),
              ),
            ),
            child: FutureBuilder(
              future: future,
              builder: (context, snapShot) {
                if (snapShot.hasError) {
                  return Center(
                    child: Text("${snapShot.error}"),
                  );
                } else if (snapShot.hasData) {
                  CurrencyConvert? data = snapShot.data as CurrencyConvert?;

                  return Container(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 280,
                            child: Image.asset(
                              "assets/images/img1.png",
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Amount  :",
                                style: myStyle,
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: CupertinoTextField(
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.limeAccent,
                                        borderRadius: new BorderRadius.all(
                                          new Radius.circular(15),
                                        ),
                                        border: Border.all(color: Colors.black)
                                    ),
                                    controller: amtController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.limeAccent,
                                borderRadius: new BorderRadius.all(
                                  new Radius.circular(15),
                                ),
                                border: Border.all(color: Colors.black),
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),

                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "         From",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showCupertinoModalPopup(
                                                context: context,
                                                builder: (_) => SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.60,
                                                      height: 250,
                                                      child: CupertinoPicker(
                                                        backgroundColor:
                                                            Colors.white,
                                                        itemExtent: 30,
                                                        children: Global
                                                            .currency
                                                            .map((e) {
                                                          return Text(
                                                            e,
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.bold,
                                                            ),

                                                          );
                                                        }).toList(),
                                                        onSelectedItemChanged:
                                                            (value) {
                                                          setState(() {
                                                            fromCurrency =
                                                                Global.currency[
                                                                    value];
                                                          });
                                                        },
                                                      ),
                                                    ));
                                          },
                                          child: Container(
                                            //color: Global.appColor.withOpacity(0.1),
                                            height: 45,
                                            child: Row(
                                              children: [
                                                const SizedBox(width: 10),
                                                Text(
                                                  fromCurrency,
                                                ),
                                                const Spacer(),
                                                const Icon(
                                                  CupertinoIcons.add_circled,
                                                  size: 20,
                                                  color: Colors.black,
                                                ),
                                                const SizedBox(width: 10),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "          To",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showCupertinoModalPopup(
                                              context: context,
                                              builder: (_) => SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.60,
                                                height: 250,
                                                child: CupertinoPicker(
                                                  backgroundColor: Colors.white,
                                                  itemExtent: 30,
                                                  children:
                                                      Global.currency.map((e) {
                                                    return Text(
                                                      e,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onSelectedItemChanged:
                                                      (value) {
                                                    setState(() {
                                                      toCurrency = Global
                                                          .currency[value];
                                                    });
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 45,
                                            child: Row(
                                              children: [
                                                const SizedBox(width: 10),
                                                Text(
                                                  toCurrency,
                                                ),
                                                const Spacer(),
                                                const Icon(
                                                  CupertinoIcons.add_circled,
                                                  size: 23,
                                                  color: Colors.black,
                                                ),
                                                const SizedBox(width: 10),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              //color: Global.appColor.withOpacity(0.2),
                            ),
                            child: Text(
                              "Result  :  ${data!.difference}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: CupertinoButton(
                              color: Colors.limeAccent,
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              onPressed: () {
                                if (amtController.text.isEmpty) {
                                } else {
                                  int amt = int.parse(amtController.text);
                                  setState(() {
                                    future = CurrencyConvertAPI.weatherAPI
                                        .currencyConvertorAPI(
                                      from: fromCurrency,
                                      to: toCurrency,
                                      amt: amt,
                                    );
                                  });
                                }
                              },
                              child: const Text(
                                "CONVERT",
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          );
  }
}
