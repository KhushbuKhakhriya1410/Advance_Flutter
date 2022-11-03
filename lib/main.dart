import 'package:flutter/material.dart';
import 'helper/helper.dart';
import 'package:sky_scrapper_3/models/model.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle titlestyle = TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold,
   color: Colors.white
  );

  TextStyle Mytyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    //backgroundColor: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.6),
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.3),
        title: const Text(
          "User Detail",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.grey,),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {});
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: UserAPI.userAPI.fetchUserAPI(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            User? data = snapshot.data;
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(50),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                     blurRadius: 9,
                    spreadRadius: 5
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 18),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      data!.image,
                    ),
                    backgroundColor: Colors.grey,
                    radius: 85,
                  ),
                  const SizedBox(height: 22),
                  Text(
                    "${data.title} ${data.firstName} ${data.lastName}",
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 17),
                  customData("Username", data.userName),
                  customData("Email", data.email),
                  customData("Phone", data.phone),
                  customData("Gender", data.gender),
                  customData("Age", data.age),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      "Address : \n${data.address}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.yellow,
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  customData(fldName, data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "$fldName",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.lime,
                ),
              ),
              const Spacer(),
              Text(
                "$data",
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.lime,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(color: Colors.white),
        ],
      ),
    );
  }
}
