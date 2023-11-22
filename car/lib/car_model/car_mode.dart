import 'package:flutter/material.dart';

class Car {
  final String name;
  final String image;

  Car({required this.name, required this.image});
}

class CarApp extends StatelessWidget {
  final List<Car> cars = [
    Car(name: 'Car 1', image: 'images/car1.png'),
    Car(name: 'Car 2', image: 'images/car2.png'),
    Car(name: 'Car 3', image: 'images/car3.png'),
    Car(name: 'Car 1', image: 'images/car1.png'),
    Car(name: 'Car 2', image: 'images/car2.png'),
    Car(name: 'Car 3', image: 'images/car3.png'),
    Car(name: 'Car 1', image: 'images/car1.png'),
    Car(name: 'Car 2', image: 'images/car2.png'),
    Car(name: 'Car 3', image: 'images/car3.png'),
    Car(name: 'Car 1', image: 'images/car1.png'),
    Car(name: 'Car 2', image: 'images/car2.png'),
    Car(name: 'Car 3', image: 'images/car3.png'),
    Car(name: 'Car 1', image: 'images/car1.png'),
    Car(name: 'Car 2', image: 'images/car2.png'),
    Car(name: 'Car 3', image: 'images/car3.png'),
    Car(name: 'Car 1', image: 'images/car1.png'),
    Car(name: 'Car 2', image: 'images/car2.png'),
    Car(name: 'Car 3', image: 'images/car3.png'),
  ];

  CarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CarGridView(cars: cars),
      ),
    );
  }
}

class CarGridView extends StatelessWidget {
  final List<Car> cars;

  const CarGridView({super.key, required this.cars});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cars.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return selectItem(cars[index].image, cars[index].name);
      },
    );
  }

  Widget selectItem(String carImageAsset, String carName) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              carImageAsset,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              carName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
