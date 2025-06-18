import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_application_practicum/pages/multiprov_b/counter_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Countermodel>(
      builder:
          (context, value, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('You have pushed the button this many times:'),
                  Text(
                    value.count.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final counter = context.read<Countermodel>();
                counter.increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
    );
  }
}
