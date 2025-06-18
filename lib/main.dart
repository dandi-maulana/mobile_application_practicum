import 'package:flutter/material.dart';
import './pages/data_crud/main.dart';

void main(List<String> args) {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "My_store", home: const Home());
  }
}
