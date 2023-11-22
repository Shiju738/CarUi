import 'package:car/car_model/car_mode.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<CarApp>> carlist = ValueNotifier([]);
late Database _db;
Future<void> carDatatbase() async {
  _db = await openDatabase('carList. db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
  });
}

Future<void> getcarlist() async {
  // carlist.value.clear();
  final _values = await _db.rawQuery('SELECT * FROM carlist');
  print(_values);
}
