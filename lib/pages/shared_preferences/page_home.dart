// import 'package:mobile_application_practicum/main.dart';
// import 'package:mobile_application_practicum/pages/shared_preferences/theme_setting.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool _switchValue = false;
//   bool? isUser;

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//     _switchValue = ThemeSettings.darkMode;
//   }

//   Future<void> _loadUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (prefs.getBool('isUser') != null) {
//       setState(() {
//         isUser = prefs.getBool('isUser');
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         actions: [
//           IconButton(icon: const Icon(Icons.exit_to_app), onPressed: _logOut),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Selamat Datang'),
//             const SizedBox(height: 20.0),
//             const Text('Pilih Tema'),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('Light'),
//                 Switch(value: _switchValue, onChanged: _onChangeSwitch),
//                 const Text('Dark'),
//               ],
//             ),
//             const SizedBox(height: 20.0),
//             Text('Status Login: ${isUser ?? false}'),
//           ],
//         ),
//       ),
//     );
//   }

//   void _onChangeSwitch(bool value) async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _switchValue = value;
//       ThemeSettings.darkMode = value;
//     });
//     await prefs.setBool('darkMode', value);
//     ReloadApp.of(context).rebuild();
//   }

//   void _logOut() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('isUser');
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => MyApp()),
//     );
//   }
// }
