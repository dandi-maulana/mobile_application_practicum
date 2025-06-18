// import 'package:mobile_application_practicum/pages/shared_preferences/page_home.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool _isLoading = false;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login with SharedPreferences')),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30.0),
//         child:
//             _isLoading
//                 ? const Center(child: Text('Please wait...'))
//                 : Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextField(
//                       controller: _emailController,
//                       decoration: const InputDecoration(
//                         hintText: 'Email',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                     const SizedBox(height: 20.0),
//                     TextField(
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         hintText: 'Password',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                     const SizedBox(height: 30.0),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         minimumSize: const Size(double.infinity, 50),
//                       ),
//                       onPressed: _login,
//                       child: const Text(
//                         'LOGIN',
//                         style: TextStyle(fontSize: 20.0, color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//       ),
//     );
//   }

//   Future<void> _login() async {
//     final email = _emailController.text.trim();
//     final password = _passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       return;
//     }

//     // Hardcoded credentials for demo
//     if (email == 'admin@domain.com' && password == '12345') {
//       setState(() => _isLoading = true);

//       // Save login state using SharedPreferences
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setBool('isUser', true);

//       // Navigate to home after delay
//       await Future.delayed(const Duration(seconds: 2));
//       if (!mounted) return;

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomePage()),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
// }
