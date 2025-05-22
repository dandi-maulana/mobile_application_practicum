import 'package:flutter/material.dart';

class LatihanKedua extends StatefulWidget {
  @override
  _LatihanKeduaState createState() => _LatihanKeduaState();
}

class _LatihanKeduaState extends State<LatihanKedua> {
  int nomor = 0;

  void tekanTombol() {
    setState(() {
      nomor = nomor + 1;
      print(nomor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Statefull Widget')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(nomor.toString(), style: TextStyle(fontSize: 50.0)),
              SizedBox(height: 20.0),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color
                  padding: EdgeInsets.all(20.0), // Padding
                ),
                icon: Icon(Icons.add, color: Colors.white),
                label: Text(
                  'Tambah Bilangan',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: tekanTombol,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
