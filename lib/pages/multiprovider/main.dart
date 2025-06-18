import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mobile_application_practicum/pages/multiprovider/cart.dart';
import 'package:mobile_application_practicum/pages/multiprovider/money.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Cart>(create: (context) => Cart()),
          ChangeNotifierProvider<Money>(create: (context) => Money()),
        ],
        child: Consumer<Money>(
          builder:
              (context, money, _) => Consumer<Cart>(
                builder:
                    (context, cart, _) => Scaffold(
                      floatingActionButton: FloatingActionButton(
                        onPressed: () {
                          if (money.balance >= 500) {
                            cart.quantity += 1;
                            money.balance -= 500;
                          }
                        },
                        child: Icon(Icons.add_shopping_cart),
                        backgroundColor: Colors.deepOrange,
                      ),
                      appBar: AppBar(
                        backgroundColor: Colors.orange[800],
                        title: Text("Multi Provider Cart"),
                      ),
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Saldo (Rp):",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Consumer<Money>(
                                      builder:
                                          (context, money, _) => Text(
                                            money.balance.toString(),
                                            style: TextStyle(
                                              color: Colors.orange[900],
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                    ),
                                  ),
                                  height: 40,
                                  width: 150,
                                  margin: EdgeInsets.all(0),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.orange[100],
                                    border: Border.all(
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Consumer<Cart>(
                                  builder:
                                      (context, cart, _) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Apple (500) x " +
                                                cart.quantity.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            (500 * cart.quantity).toString(),
                                            style: TextStyle(
                                              color: Colors.orange[900],
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                ),
                              ),
                              height: 40,
                              margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.lime),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                              child: TextButton(
                                child: Text('-'),
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Colors.white, // previously 'primary'
                                  backgroundColor: Colors.red,
                                  disabledForegroundColor:
                                      Colors.grey, // previously 'onSurface'
                                ),
                                onPressed: () {
                                  int total = cart.quantity * 500;
                                  if (total > 0) {
                                    cart.quantity -= 1;
                                    money.balance += 500;
                                  }

                                  if (total == 0) {
                                    print("Keranjang Kosong !");
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
        ),
      ),
    );
  }
}
