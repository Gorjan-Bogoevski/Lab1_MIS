import 'package:audi1/screens/details.dart';
import 'package:audi1/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити - 221193',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/details": (context) => const Details(),
      },
    );
  }
}
