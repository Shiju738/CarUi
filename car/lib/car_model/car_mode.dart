import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Car {
  final String name;
  final String image;

  Car({required this.name, required this.image});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }
}

class CarApp extends StatelessWidget {
  final List<Car> cars = [
    Car(name: 'Car 1', image: 'images/car1.png'),
    Car(name: 'Car 2', image: 'images/car2.png'),
    Car(name: 'Car 5', image: 'images/car3.png'),
    Car(name: 'Car 1', image: 'images/car1.png'),
  ];

  final DatabaseHelper databaseHelper = DatabaseHelper();

  CarApp({Key? key}) : super(key: key) {
    _insertInitialCars();
  }

  Future<void> _insertInitialCars() async {
    for (var car in cars) {
      await databaseHelper.insertCar(car);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Car>>(
      future: databaseHelper.getCars(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Text('No cars found.'),
              ),
            ),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: CarGridView(cars: snapshot.data!),
            ),
          );
        }
      },
    );
  }
}

class CarGridView extends StatelessWidget {
  final List<Car> cars;

  const CarGridView({Key? key, required this.cars}) : super(key: key);

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

class DatabaseHelper {
  late Database _db;

  Future<void> initializeDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'my_database.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE cars(id INTEGER PRIMARY KEY, name TEXT, image TEXT)',
        );
      },
    );
  }

  Future<void> insertCar(Car car) async {
    await initializeDatabase();
    await _db.insert(
      'cars',
      car.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Car>> getCars() async {
    await initializeDatabase();
    final List<Map<String, dynamic>> maps = await _db.query('cars');
    return List.generate(maps.length, (i) {
      return Car(
        name: maps[i]['name'],
        image: maps[i]['image'],
      );
    });
  }
}
