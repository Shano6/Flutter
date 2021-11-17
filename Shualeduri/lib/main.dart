import 'package:flutter/material.dart';
import 'package:metric_converter/presentation/screens/cars_add.dart';
import 'package:metric_converter/presentation/screens/cars_detail.dart';
import 'package:metric_converter/presentation/screens/cars_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const CarsPage(title: 'Cars'),
        '/details': (context) => const CarsDetail(title: 'Car Details'),
        '/add': (context) => const CarsAdd(title: 'Add Car',),
      },
    );
  }
}


