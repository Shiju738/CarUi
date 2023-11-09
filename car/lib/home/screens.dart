// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color buttonColor = Colors.white;

  void changeColor() {
    setState(() {
      buttonColor = const Color.fromARGB(255, 111, 212, 116);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 10, top: 30),
        child: SafeArea(
          child: Expanded(
            child: Column(
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text(
                      'Car Rent',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.notification_important_outlined,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 390,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.search),
                            Expanded(
                              child: TextField(
                                onTap: () {},
                                decoration: const InputDecoration(
                                  hintText: 'Search anything...',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // const Search();
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const Search()));
                              },
                              icon: const Icon(Icons.tune),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    selectitem('images/2554936.png', 'Car '),
                    selectitem('images/bikes.png', 'Bike '),
                    selectitem('images/cycle.png', 'Bycycle '),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: SizedBox(
                    child: Expanded(
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row selectitem(String carImageAsset, String carName) {
    return Row(
      children: [
        GestureDetector(
          onTap: changeColor,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Image.asset(
                  carImageAsset,
                  width: 40,
                  height: 40,
                ),
                const Divider(
                  indent: 5,
                ),
                const SizedBox(width: 5),
                Text(
                  carName,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
