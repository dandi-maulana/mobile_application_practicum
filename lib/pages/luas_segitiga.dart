import 'package:flutter/material.dart';

class LuasSegitiga extends StatefulWidget {
  @override
  _LuasSegitigaState createState() => _LuasSegitigaState();
}

class _LuasSegitigaState extends State<LuasSegitiga> {
  TextEditingController alasController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();

  String nilaiAlas = '';
  String nilaiTinggi = '';
  double hasil = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hitung Luas Segitiga'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                onChanged: (text) {
                  setState(() {
                    nilaiAlas = text;
                  });
                },
                controller: alasController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.straighten, color: Colors.green),
                  labelText: 'Panjang Alas *',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (text) {
                  setState(() {
                    nilaiTinggi = text;
                  });
                },
                controller: tinggiController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.height, color: Colors.green),
                  labelText: 'Tinggi Segitiga *',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Luas: ${hasil.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: Icon(Icons.calculate),
                label: Text(
                  'HITUNG LUAS',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    double alas = double.parse(nilaiAlas);
                    double tinggi = double.parse(nilaiTinggi);
                    hasil = (alas * tinggi) / 2;
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
