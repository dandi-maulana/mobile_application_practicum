import 'package:flutter/material.dart';
import 'editdata.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class Detail extends StatefulWidget {
  final List list;
  final int index;
  Detail({required this.index, required this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://192.168.1.8:8080/api/deleteData.php";
    http.post(Uri.parse(url), body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "Are You sure want to delete '${widget.list[widget.index]['item_name']}'",
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("OK DELETE!", style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                deleteData();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) => Home()),
                );
              },
            ),
            ElevatedButton(
              child: Text("CANCEL", style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.list[widget.index]['item_name']}")),
      body: Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(padding: const EdgeInsets.only(top: 30.0)),
                Text(
                  widget.list[widget.index]['item_name'],
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Code : ${widget.list[widget.index]['item_code']}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Price : ${widget.list[widget.index]['price']}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Stock : ${widget.list[widget.index]['stock']}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(padding: const EdgeInsets.only(top: 30.0)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text("EDIT"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed:
                          () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder:
                                  (BuildContext context) => EditData(
                                    list: widget.list,
                                    index: widget.index,
                                  ),
                            ),
                          ),
                    ),
                    ElevatedButton(
                      child: Text("DELETE"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () => confirm(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
