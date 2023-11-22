import 'package:car/car_model/car_mode.dart';
import 'package:car/home/filterscreen.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

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
          // child: Expanded(
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
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                              const Filter();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Filter()));
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
              const Padding(padding: EdgeInsets.only(top: 10)),
              Expanded(
                child: CarApp(),
              ),

              // Expanded(
              //   child: GridView.count(
              //       crossAxisCount: 2,
              //       crossAxisSpacing: 4.0,
              //       mainAxisSpacing: 10.0,
              //       children: [_loop()]

              //       //  List.generate(10, (index) {
              //       //   return Expanded(
              //       //     child: FillImageCard(
              //       //       heightImage: 100,
              //       //       imageProvider: const AssetImage('images/car2.png'),
              //       //       // tags: [_tag('Category', () {}), _tag('Product', () {})],
              //       //       title: _title(),
              //       //       description: _content(),
              //       //     ),
              //       //   );
              //       // }),
              //       ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget _title({Color? color}) {
    return Text(
      'Car',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color),
    );
  }

  Widget _content({Color? color}) {
    return Text(
      'This a card description',
      style: TextStyle(color: color),
    );
  }

  Widget _loop() {
    List<Widget> imageCards = [];
    for (var i = 0; i < 10; i++) {
      imageCards.add(FillImageCard(
        heightImage: 100,
        imageProvider: const AssetImage('images/car2.png'),
        title: _title(),
        description: _content(),
      ));
    }
    return GridView.count(
      crossAxisCount: 2,
      children: imageCards,
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

class CarModel {
  final String carName;
  final String carImage;
  final String location;
  final String price;

  CarModel(
      {required this.carImage,
      required this.carName,
      required this.location,
      required this.price});

  static List<CarModel> carList = [
    CarModel(
        carImage: 'EDFVSD',
        carName: 'carName',
        location: 'location',
        price: 'price'),
    CarModel(
        carImage: 'carImage',
        carName: 'carName',
        location: 'location',
        price: 'price')
  ];
}

class CarModels {
  final String carName;
  final String carImage;
  final String location;
  final String price;

  CarModels({
    required this.carImage,
    required this.carName,
    required this.location,
    required this.price,
  });

  static List<CarModel> carList = [
    CarModel(
      carImage: 'assets/car1.png',
      carName: 'Car 1',
      location: 'Location 1',
      price: '\$30,000',
    ),
    CarModel(
      carImage: 'assets/car2.png',
      carName: 'Car 2',
      location: 'Location 2',
      price: '\$25,000',
    ),
  ];
}

// class CarGridView extends StatelessWidget {
//   Widget selectItem(String carImageAsset, String carName) {
//     return GestureDetector(
//       onTap: () {
//         // Handle tap action for each car item
//         print('Tapped on $carName');
//       },
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         height: 150,
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               carImageAsset,
//               width: 80,
//               height: 80,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               carName,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: CarModel.carList.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//       itemBuilder: (BuildContext context, int index) {
//         return selectItem(
//           CarModel.carList[index].carImage,
//           CarModel.carList[index].carName,
//         );
//       },
//     );
//   }
// }
