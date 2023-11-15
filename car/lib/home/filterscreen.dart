import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(247, 248, 250, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    const Text(
                      'Filter',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.notifications_outlined,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      Filter_List(carName: 'Tasla'),
                      Filter_List(carName: '\$420-\$7254'),
                      Filter_List(carName: 'Electro'),
                      Filter_List(carName: '4 Seat'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                const text(
                                  name: 'Brand',
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.13,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: const [
                                      Row(
                                        children: [
                                          LogoSection(
                                              imagePath: 'images/m2.png'),
                                          LogoSection(
                                              imagePath: 'images/m2.png'),
                                          LogoSection(
                                              imagePath: 'images/m2.png'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                const Divider(
                                  color: Colors.black54,
                                  endIndent: 10,
                                  indent: 10,
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                const text(name: 'Price Card'),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                const RangeSliderExample(),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    text(name: '\$320'),
                                    text(name: '\$1000')
                                  ],
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                const Divider(
                                  color: Colors.black54,
                                  endIndent: 10,
                                  indent: 10,
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                const text(name: 'Fuel Type'),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: const [
                                        Filter_List(carName: 'All'),
                                        Filter_List(carName: 'Electro'),
                                        Filter_List(carName: 'Diesal'),
                                        Filter_List(carName: 'Gas'),
                                        Filter_List(carName: 'Gas')
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                const Divider(
                                  color: Colors.black54,
                                  endIndent: 10,
                                  indent: 10,
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                const text(name: 'Car Seats'),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 74),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: const [
                                        Filter_List(carName: '2 Seat'),
                                        Filter_List(carName: '3 Seat'),
                                        Filter_List(carName: '4 Seat'),
                                        Filter_List(carName: '5 Seat'),
                                        Filter_List(carName: '6 Seat')
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RangeSliderExample extends StatefulWidget {
  const RangeSliderExample({super.key});

  @override
  State<RangeSliderExample> createState() => _RangeSliderExampleState();
}

class _RangeSliderExampleState extends State<RangeSliderExample> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentRangeValues,
      max: 100,
      divisions: 5,
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
  }
}

// ignore: camel_case_types
class text extends StatelessWidget {
  final String name;
  const text({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class LogoSection extends StatefulWidget {
  final String imagePath;

  const LogoSection({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LogoSectionState createState() => _LogoSectionState();
}

class _LogoSectionState extends State<LogoSection> {
  Color backgroundColor = const Color.fromARGB(247, 248, 250, 255);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          backgroundColor = Colors.green.shade50;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Image.asset(widget.imagePath),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Filter_List extends StatelessWidget {
  final String carName;

  const Filter_List({
    Key? key,
    required this.carName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                carName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
