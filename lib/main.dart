import 'package:mobile_application_practicum/pages/multiprov_b/home_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MultiProv",
      home: const MyHomePage(title: "Multi Prov"),
    );
  }
}
