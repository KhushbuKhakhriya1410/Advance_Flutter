import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:outcaster/utils/colors.dart';
import 'package:outcaster/utils/image.dart';
import 'package:outcaster/utils/strings.dart';
import 'package:outcaster/utils/textstyle.dart';

class CupertinoStorePage extends StatefulWidget {
  const CupertinoStorePage({Key? key}) : super(key: key);

  @override
  State<CupertinoStorePage> createState() => _CupertinoStorePageState();
}

class _CupertinoStorePageState extends State<CupertinoStorePage> {
  int i = 0;
  DateTime selected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            IndexedStack(
              index: i,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: titlecolor,
                      ),
                      alignment: Alignment(-0.9, 0.7),
                      height: 80,
                      child: Text(
                        cupertinostore,
                        style: blackbold20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(bag),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bagtitle,
                              style: black15,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              bagprice,
                              style: grey12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 235,
                        ),
                        Icon(Icons.add_circle_outline_rounded, color: blueicon),
                      ],
                    ),
                    Divider(
                      endIndent: 30,
                      indent: 100,
                      color: blackcolordivider,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(sunglasses),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sunglassestitle,
                              style: black15,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              sunglassesprice,
                              style: grey12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 220,
                        ),
                        Icon(Icons.add_circle_outline_rounded, color: blueicon),
                      ],
                    ),
                    Divider(
                      endIndent: 30,
                      indent: 100,
                      color: blackcolordivider,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(belt),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              belttitle,
                              style: black15,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              beltprice,
                              style: grey12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 255,
                        ),
                        Icon(Icons.add_circle_outline_rounded, color: blueicon),
                      ],
                    ),
                    Divider(
                      endIndent: 30,
                      indent: 100,
                      color: blackcolordivider,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(chain),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chaintitle,
                              style: black15,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              chainprice,
                              style: grey12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 245,
                        ),
                        Icon(Icons.add_circle_outline_rounded, color: blueicon),
                      ],
                    ),
                    Divider(
                      endIndent: 30,
                      indent: 100,
                      color: blackcolordivider,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(earrings),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              earringstitle,
                              style: black15,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              earringsprice,
                              style: grey12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 250,
                        ),
                        Icon(Icons.add_circle_outline_rounded, color: blueicon),
                      ],
                    ),
                    Divider(
                      endIndent: 30,
                      indent: 100,
                      color: blackcolordivider,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(socks),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sockstitle,
                              style: black15,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              socksprice,
                              style: grey12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 250,
                        ),
                        Icon(Icons.add_circle_outline_rounded, color: blueicon),
                      ],
                    ),
                    Divider(
                      endIndent: 30,
                      indent: 100,
                      color: blackcolordivider,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(keychain),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              keychaintitle,
                              style: black15,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              keychainprice,
                              style: grey12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 240,
                        ),
                        Icon(Icons.add_circle_outline_rounded, color: blueicon),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: titlecolor,
                      ),
                      alignment: Alignment.center,
                      height: 50,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Icon(
                            Icons.search,
                            color: greyicon,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            cupertinostoresearch,
                            style: black15,
                          ),
                          const SizedBox(width: 350),
                          Icon(
                            Icons.cancel_outlined,
                            color: greyicon,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(shirt1),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shirt1title,
                              style: black15,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              shirt1price,
                              style: grey12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 200,
                        ),
                        Icon(Icons.add_circle_outline_rounded, color: blueicon),
                      ],
                    ),
                    Divider(
                      endIndent: 30,
                      indent: 100,
                      color: blackcolordivider,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(shirt2),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shirt2title,
                              style: black15,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              shirt2price,
                              style: grey12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 230,
                        ),
                        Icon(Icons.add_circle_outline_rounded, color: blueicon),
                      ],
                    ),
                    Divider(
                      endIndent: 30,
                      indent: 100,
                      color: blackcolordivider,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(shirt3),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shirt3title,
                              style: black15,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              shirt3price,
                              style: grey12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 210,
                        ),
                        Icon(Icons.add_circle_outline_rounded, color: blueicon),
                      ],
                    ),
                    Divider(
                      endIndent: 30,
                      indent: 100,
                      color: blackcolordivider,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(shirt4),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shirt4title,
                              style: black15,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              shirt4price,
                              style: grey12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 230,
                        ),
                        Icon(Icons.add_circle_outline_rounded, color: blueicon),
                      ],
                    ),
                    Divider(
                      endIndent: 30,
                      indent: 100,
                      color: blackcolordivider,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(shirt5),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shirt5title,
                              style: black15,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              shirt5price,
                              style: grey12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 240,
                        ),
                        Icon(Icons.add_circle_outline_rounded, color: blueicon),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: titlecolor,
                      ),
                      alignment: Alignment(-0.9, 0.7),
                      height: 80,
                      child: Text(
                        cupertinoshoppingcart,
                        style: blackbold20,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: CupertinoTextField(
                        decoration:
                            BoxDecoration(border: Border(bottom: BorderSide())),
                        prefix: Icon(Icons.person, color: greyicon),
                        placeholder: "Name",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: CupertinoTextField(
                        decoration:
                            BoxDecoration(border: Border(bottom: BorderSide())),
                        prefix: Icon(Icons.email, color: greyicon),
                        placeholder: "Email",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: CupertinoTextField(
                        decoration:
                            BoxDecoration(border: Border(bottom: BorderSide())),
                        prefix: Icon(Icons.place_sharp, color: greyicon),
                        placeholder: "Location",
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.watch_later_outlined,
                          color: greyicon,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          deliverytime,
                          style: grey15light,
                        ),
                        const SizedBox(
                          width: 200,
                        ),
                        Text(
                          "${selected}",
                          style: grey15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
                          setState(() {
                            selected = val;
                            print(selected);
                          });
                        },
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 20),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(chain),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chaintitle,
                                    style: black15,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    chainprice,
                                    style: grey12,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 240,
                              ),
                              Text(
                                "${chainprice}.00",
                                style: black15,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 20),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(sunglasses),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sunglassestitle,
                                    style: black15,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    sunglassesprice,
                                    style: grey12,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 220,
                              ),
                              Text(
                                "${sunglassesprice}.00",
                                style: black15,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 20),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(keychain),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    keychaintitle,
                                    style: black15,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    keychainprice,
                                    style: grey12,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 240,
                              ),
                              Text(
                                "${keychainprice}.00",
                                style: black15,
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment(0.9, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  shipping,
                                  style: grey12,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  tax,
                                  style: grey12,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(total, style: black18)
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            CupertinoTabBar(
              currentIndex: i,
              onTap: (val) {
                setState(() {
                  i = val;
                  print(i);
                });
              },
              activeColor: blueicon,
              items: [
                BottomNavigationBarItem(
                  label: productbnb,
                  icon: Icon(
                    CupertinoIcons.home,
                    size: 20,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.search,
                    size: 20,
                  ),
                  label: searchbnb,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.cart,
                    size: 20,
                  ),
                  label: cartbnb,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
