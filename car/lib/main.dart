// import 'package:car/car_model/datbase.dart';
import 'package:car/car_model/datbase.dart';
import 'package:car/home/screens.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // await carDatatbase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DemoApp',
      home: HomeScreen(),
    );
  }
}
