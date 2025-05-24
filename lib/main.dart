import 'package:mobile_application_practicum/pages/shared_preferences2/shared_home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(key: Key('MyHomePage')), // Wajib isi key,
    );
  }
}
