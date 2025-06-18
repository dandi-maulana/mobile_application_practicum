import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerStock = TextEditingController();

  void addData() async {
    var url = "http://192.168.1.8:8080/api/adddata.php";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "itemcode": controllerCode.text,
        "itemname": controllerName.text,
        "price": controllerPrice.text,
        "stock": controllerStock.text,
      },
    );

    var data = json.decode(response.body);
    if (data['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data added successfully'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Home()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add data: ${data['message']}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ADD DATA")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: controllerCode,
                  decoration: InputDecoration(
                    hintText: "Item Code",
                    labelText: "Item Code",
                  ),
                ),
                TextField(
                  controller: controllerName,
                  decoration: InputDecoration(
                    hintText: "Item Name",
                    labelText: "Item Name",
                  ),
                ),
                TextField(
                  controller: controllerPrice,
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                  ),
                ),
                TextField(
                  controller: controllerStock,
                  decoration: InputDecoration(
                    hintText: "Stock",
                    labelText: "Stock",
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("ADD DATA"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: addData,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
