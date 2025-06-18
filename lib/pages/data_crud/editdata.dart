import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;
  EditData({required this.list, required this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerCode;
  late TextEditingController controllerName;
  late TextEditingController controllerPrice;
  late TextEditingController controllerStock;

  void editData() async {
    var url = "http://192.168.1.8:8080/api/editdata.php";
    var response = await http.post(
      Uri.parse(url),
      body: {
        "id": widget.list[widget.index]['id'],
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
          content: Text('Data updated successfully'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Home()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update data: ${data['message']}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    controllerCode = TextEditingController(
      text: widget.list[widget.index]['item_code'],
    );
    controllerName = TextEditingController(
      text: widget.list[widget.index]['item_name'],
    );
    controllerPrice = TextEditingController(
      text: widget.list[widget.index]['price'],
    );
    controllerStock = TextEditingController(
      text: widget.list[widget.index]['stock'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EDIT DATA")),
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
                  child: Text("EDIT DATA"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: editData,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
