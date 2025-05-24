import 'package:flutter/material.dart';

class GojekPage extends StatelessWidget {
  const GojekPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Image.asset("assets/logo/white.png", height: 30),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Gopay Section
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blue[50],
                child: Column(
                  children: [
                    // Gopay Balance - Modified version
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/icon/gopay.png", width: 100),
                          ],
                        ),
                        const Text(
                          "Rp. 300.000",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Gopay Actions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildGopayAction("assets/icon/topup.png", "Isi Saldo"),
                        _buildGopayAction("assets/icon/pay.png", "Transfer"),
                        _buildGopayAction("assets/icon/nearby.png", "Lokasi"),
                        _buildGopayAction("assets/icon/more.png", "Lainnya"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Services Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // First Row of Services
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildService("assets/icon/go-car.png", "Go Car"),
                        _buildService("assets/icon/go-ride.png", "Go Ride"),
                        _buildService(
                          "assets/icon/go-bluebird.png",
                          "Go BlueBird",
                        ),
                        _buildService("assets/icon/go-food.png", "Go Food"),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Second Row of Services
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildService("assets/icon/go-pulsa.png", "Go Pulsa"),
                        _buildService("assets/icon/go-send.png", "Go Send"),
                        _buildService("assets/icon/go-deals.png", "Go Deals"),
                        _buildService("assets/icon/go-more.png", "Go More"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGopayAction(String iconPath, String label) {
    return Column(
      children: [
        Image.asset(iconPath, width: 32),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildService(String iconPath, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(iconPath, width: 32),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
