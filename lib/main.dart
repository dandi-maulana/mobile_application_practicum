import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Latihan Pertama",
      home: LatihanPertama(),
    ),
  );
}

const String logoUMA =
    'https://hukum.uma.ac.id/wp-content/uploads/2018/12/Logo-Universitas-Medan-Area.png';

class LatihanPertama extends StatelessWidget {
  const LatihanPertama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Flutter Pertama"),
        backgroundColor: Colors.blue,
        leading: Icon(Icons.home),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.label_important),
                Text(
                  'Artikel Terbaru',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ],
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Image.network(logoUMA, width: 200.0),
                  ImageNetwork(image: logoUMA, height: 200, width: 200),
                  Text(
                    'Universitas Medan Area',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('TOMBOL', style: TextStyle(fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
