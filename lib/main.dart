import 'package:flutter/material.dart';
import './pages/multiprov/main.dart';

void main(List<String> args) {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "MultiProv", home: const MyApp());
  }
}
