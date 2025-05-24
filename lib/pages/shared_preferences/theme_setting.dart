import 'package:flutter/material.dart';

class ThemeSettings {
  static bool darkMode = false;
}

class ReloadApp extends StatefulWidget {
  final Widget Function(BuildContext context) builder;

  const ReloadApp({required this.builder, Key? key}) : super(key: key);

  @override
  ReloadAppState createState() => ReloadAppState();

  static ReloadAppState of(BuildContext context) {
    return context.findRootAncestorStateOfType<ReloadAppState>()!;
  }
}

class ReloadAppState extends State<ReloadApp> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  void rebuild() {
    setState(() {});
  }
}
