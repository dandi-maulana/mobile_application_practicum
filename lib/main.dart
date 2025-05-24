import 'package:mobile_application_practicum/pages/shared_preferences/theme_setting.dart';
import 'package:mobile_application_practicum/pages/shared_preferences/page_home.dart';
import 'package:mobile_application_practicum/pages/shared_preferences/page_login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUser = false;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  @override
  Widget build(BuildContext context) {
    return ReloadApp(
      builder:
          (context) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness:
                  ThemeSettings.darkMode ? Brightness.dark : Brightness.light,
            ),
            title: "Praktikum Keenam",
            home: SplashScreen(isUser),
          ),
    );
  }

  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isUser') != null) {
      setState(() {
        isUser = prefs.getBool('isUser')!;
      });
    }

    if (prefs.getBool('darkMode') != null) {
      setState(() {
        ThemeSettings.darkMode = prefs.getBool('darkMode')!;
      });
    }

    print('Loaded Theme = ${ThemeSettings.darkMode}');
  }
}

class SplashScreen extends StatefulWidget {
  final bool isUser;
  SplashScreen(this.isUser);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget.isUser ? HomePage() : LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Load App ...')));
  }
}
