import 'package:flutter/material.dart';

class LatihanAppbarPage extends StatelessWidget {
  const LatihanAppbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan AppBar'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ini pesan info dengan Snackbar')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {
              openPage(context);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('This is the home page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

void openPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) {
        return const NextPage(); // Dipindahkan ke widget terpisah
      },
    ),
  );
}

class NextPage extends StatelessWidget {
  const NextPage({super.key}); // Widget terpisah dengan const

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next page')),
      body: const Center(
        child: Text('This is the next page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
