import 'package:flutter/material.dart';
import 'package:mobile_application_practicum/pages/shared_preferences2/insert.dart';
import 'package:mobile_application_practicum/pages/shared_preferences2/data.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // data customer yang akan ditampilkan di list view
  // beri nilai awal berupa list kosong agar tidak error
  // nantinya akan diisi data dari Shared Preferences
  var savedData = [];

  // method untuk mengambil data Shared Preferences
  getSavedData() async {
    var data = await Data.getData();
    // setelah data didapat panggil setState agar data segera dirender
    setState(() {
      savedData = data;
    });
  }

  // init state ini dipanggil pertama kali oleh flutter
  @override
  void initState() {
    super.initState();
    // baca Shared Preferences
    getSavedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // action tombol ADD untuk proses insert
              // nilai yang dikirim diisi null
              // agar di halaman insert tahu jika null berarti operasi insert data
              // jika tidak null maka update data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Insert(index: null, value: null),
                ),
              ).then((value) {
                // jika halaman insert ditutup ambil kembali Shared Preferences
                // untuk mendapatkan data terbaru dan segera ditampilkan ke user
                // misal jika ada data customer yang ditambahkan
                getSavedData();
              });
            },
            child: Text('ADD', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: ListView.builder(
          itemCount: savedData.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(savedData[index]['name']),
              subtitle: Text(
                savedData[index]['address'] + ' ' + savedData[index]['phone'],
              ),
              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              onTap: () {
                // aksi saat user klik pada item customer pada list view
                // nilai diisi selain null menandakan di halaman insert operasi yang berjalan
                // adalah update atau delete
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            Insert(index: index, value: savedData[index]),
                  ),
                ).then((value) {
                  // jika halaman insert ditutup ambil kembali Shared Preferences
                  // untuk mendapatkan data terbaru dan segera ditampilkan ke user
                  // misal jika ada data customer yang diedit atau dihapus
                  getSavedData();
                });
              },
            );
          },
        ),
      ),
    );
  }
}
