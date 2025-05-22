import 'package:flutter/material.dart';

class latihanTextField extends StatefulWidget {
  @override
  _latihanTextFieldState createState() => _latihanTextFieldState();
}

class _latihanTextFieldState extends State<latihanTextField> {
  TextEditingController textFieldA = TextEditingController();
  TextEditingController textFieldB = TextEditingController();

  String nilaiA = '', nilaiB = '';
  int hasil = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Statefull Widget')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                onChanged: (text) {
                  setState(() {
                    nilaiA = text;
                  });
                },
                controller: textFieldA,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.bookmark),
                  labelText: 'Variabel A *',
                ),
              ),
              TextFormField(
                onChanged: (text) {
                  setState(() {
                    nilaiB = text;
                  });
                },
                controller: textFieldB,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.bookmark),
                  labelText: 'Variabel B *',
                ),
              ),
              Text(hasil.toString(), style: TextStyle(fontSize: 30.0)),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Background color
                  padding: EdgeInsets.all(10.0), // Padding
                ),
                icon: Icon(Icons.add),
                label: Text(
                  'HITUNG',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    int a = int.parse(nilaiA);
                    int b = int.parse(nilaiB);
                    hasil = a + b;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
