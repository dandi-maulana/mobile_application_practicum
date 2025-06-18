import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './adddata.dart';
import 'detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = getData();
  }

  Future<List> getData() async {
    final response = await http.get(
      Uri.parse("http://192.168.1.8:8080/api/getdata.php"),
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['status'] == 'success') {
        return data['data'];
      } else {
        throw Exception(data['message']);
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  void refreshData() {
    setState(() {
      _dataFuture = getData();
    });
  }

  void navigateToAddData() async {
    final result = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => AddData()));
    if (result == true) {
      refreshData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY STORE'),
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: refreshData),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: navigateToAddData,
      ),
      body: FutureBuilder<List>(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return snapshot.hasData
              ? ItemList(list: snapshot.data ?? [])
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, i) {
        var item = list[i];
        var title = item['item_name'] ?? 'Unknown'; // jika NULL
        var stock =
            item['stock'] != null ? item['stock'].toString() : 'Unknown';

        return Container(
          padding: EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Detail(list: list, index: i),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(title),
                leading: Icon(Icons.widgets),
                subtitle: Text("Stock: $stock"),
              ),
            ),
          ),
        );
      },
    );
  }
}
