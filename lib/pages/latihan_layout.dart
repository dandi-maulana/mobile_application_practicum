import 'package:flutter/material.dart';

class LatihanLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Flutter Ketiga (Layouting)"),
        backgroundColor: Colors.blue,
        leading: Icon(Icons.home),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Icon(Icons.account_circle, size: 50),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Flutter McFlutter',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'Experienced App Developer',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('123 Main Street'), Text('123-456-789')],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.accessibility, size: 30),
              Icon(Icons.timer, size: 30),
              Icon(Icons.phone_android, size: 30),
              Icon(Icons.phone_iphone, size: 30),
            ],
          ),
        ],
      ),
    );
  }
}
