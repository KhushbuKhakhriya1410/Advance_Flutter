import 'package:sky_scrapper_2/helpers/currency_helper.dart';
import 'package:sky_scrapper_2/models/currency_models.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic selectedCountry;
  List country = [];
  List flag = [];
  dynamic i;
  TextStyle mystyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.limeAccent.withOpacity(0.8),
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        title: const Text(
          "Covid-19 Case Tracker",
          style: TextStyle(color: Colors.lime),
        ),
        elevation: 1,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: FutureBuilder(
              future: CovidApiHelper.covidApiHelper.fetchCovidData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error : ${snapshot.error}'),
                  );
                } else if (snapshot.hasData) {
                  List<CovidData> data = snapshot.data as List<CovidData>;
                  country = data.map((e) => e.name).toList();
                  return Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.all(8),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: DropdownButtonFormField(
                              dropdownColor: Colors.black.withOpacity(0.90),
                              iconSize: 35,
                              icon: const Icon(
                                Icons.location_on_outlined,
                                color: Colors.lime,
                              ),
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.black.withOpacity(0.5)),
                              hint: const Text(
                                "Select Country",
                                style: TextStyle(color: Colors.lime),
                              ),
                              value: selectedCountry,
                              onChanged: (val) {
                                setState(() {
                                  selectedCountry = val;
                                  i = country.indexOf(val);
                                });
                              },
                              items: country.map((e) {
                                return DropdownMenuItem(

                                  value: e,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                          color: Colors.lime.withOpacity(0.9)),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          (i != null)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Card(
                                      color: Colors.black.withOpacity(0.5),
                                      shadowColor: Colors.black,
                                      shape: BeveledRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.yellowAccent
                                                .withOpacity(0.7)),
                                      ),
                                      elevation: 10,
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              height: 130,
                                              width: double.infinity,
                                              child: Image.network(
                                                data[i].flag,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${data[i].name}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Population: ${data[i].Population}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    infocard(
                                        title: "Confirmed",
                                        totalCount: data[i].totalConfirmed,
                                        todayCount: data[i].todayConfirmed,
                                        color: Colors.red),
                                    infocard(
                                        title: "Recovered",
                                        totalCount: data[i].totalRecovered,
                                        todayCount: data[i].todayRecovered,
                                        color: Colors.green),
                                    infocard(
                                        title: "Deaths",
                                        totalCount: data[i].totalDeaths,
                                        todayCount: data[i].todayDeaths,
                                        color: Colors.blueGrey),
                                    infocard(
                                        title: "Active",
                                        totalCount: data[i].totalActive,
                                        todayCount: "",
                                        color: Colors.blue),
                                    infocard(
                                        title: "Critical",
                                        totalCount: data[i].totalCritical,
                                        todayCount: "",
                                        color: Colors.amber),
                                  ],
                                )
                              : Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        getinfo2(
                                            color:
                                                Colors.green.withOpacity(0.1)),
                                        Spacer(),
                                        getinfo2(
                                            color:
                                                Colors.pink.withOpacity(0.1)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    getinfo1(
                                        color: Colors.red.withOpacity(0.1)),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        getinfo2(
                                            color:
                                                Colors.blue.withOpacity(0.1)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        getinfo2(
                                            color:
                                                Colors.blue.withOpacity(0.1)),
                                        SizedBox(
                                          width: 50,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  getinfo1({required color}) {
    return Icon(
      Icons.coronavirus_outlined,
      size: 60,
      color: color,
    );
  }

  getinfo2({required color}) {
    return Icon(
      Icons.coronavirus_rounded,
      size: 60,
      color: color,
    );
  }

  infocard(
      {required title,
      required totalCount,
      required todayCount,
      required color}) {
    return Card(
      color: Colors.black.withOpacity(0.5),
      shadowColor: Colors.black,
      shape: BeveledRectangleBorder(
        side: BorderSide(color: Colors.yellowAccent.withOpacity(0.7)),
      ),
      elevation: 5,
      child: Container(
        height: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "$totalCount",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "$todayCount",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
