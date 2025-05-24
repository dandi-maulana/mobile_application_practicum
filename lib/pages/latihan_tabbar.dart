import 'package:flutter/material.dart';

class LatihanTabBar extends StatelessWidget {
  const LatihanTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Latihan AppBar'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(text: 'All'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Car Tab
              Container(
                padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                child: Column(
                  children: [
                    const Icon(Icons.directions_car, size: 100),
                    const Text('Mobil', style: TextStyle(fontSize: 30)),
                    Expanded(
                      child: _buildTransportList(
                        trans
                            .where((t) => t.foto == Icons.directions_car)
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),

              // Transit Tab
              Container(
                padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                child: Column(
                  children: [
                    const Icon(Icons.directions_train, size: 100),
                    const Text('Kereta Api', style: TextStyle(fontSize: 30)),
                    Expanded(
                      child: _buildTransportList(
                        trans
                            .where((t) => t.foto == Icons.directions_transit)
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),

              // Bike Tab
              Container(
                padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                child: Column(
                  children: [
                    const Icon(Icons.directions_bike, size: 100),
                    const Text('Sepeda', style: TextStyle(fontSize: 30)),
                    Expanded(
                      child: _buildTransportList(
                        trans
                            .where((t) => t.foto == Icons.directions_bike)
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),

              // All Tab
              _buildTransportList(trans),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransportList(List<Transports> transports) {
    return ListView.builder(
      itemCount: transports.length,
      itemBuilder: (context, index) {
        final transport = transports[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(transport.foto, size: 70),
                      const SizedBox(width: 5),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transport.nama,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(transport.deskripsi),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.favorite,
                color: transport.isLike ? Colors.red : Colors.grey[300],
              ),
            ],
          ),
        );
      },
    );
  }
}

class Transports {
  final IconData foto;
  final String nama;
  final String deskripsi;
  final bool isLike;

  const Transports({
    required this.foto,
    required this.nama,
    required this.deskripsi,
    required this.isLike,
  });
}

// Data Dummy Transport
final List<Transports> trans = [
  const Transports(
    foto: Icons.directions_car,
    nama: 'Mobil Sedan',
    deskripsi: 'Kendaraan Roda Empat',
    isLike: true,
  ),
  const Transports(
    foto: Icons.directions_transit,
    nama: 'Kereta Api',
    deskripsi: 'Angkutan Gerbong dengan Rel',
    isLike: false,
  ),
  const Transports(
    foto: Icons.directions_bike,
    nama: 'Sepeda Motor',
    deskripsi: 'Kendaraan roda dua pribadi',
    isLike: true,
  ),
  const Transports(
    foto: Icons.directions_boat,
    nama: 'Speed Boat',
    deskripsi: 'Perahu Mesin Jet',
    isLike: false,
  ),
  const Transports(
    foto: Icons.directions_boat,
    nama: 'Kapal Ferry',
    deskripsi: 'Perahu Besar Mesin Besar',
    isLike: true,
  ),
  const Transports(
    foto: Icons.directions_boat,
    nama: 'Sampan Kayu',
    deskripsi: 'Perahu Dayung Apung',
    isLike: false,
  ),
  const Transports(
    foto: Icons.directions_bus,
    nama: 'Mobil Bus',
    deskripsi: 'Mobil Bus Besar',
    isLike: true,
  ),
  const Transports(
    foto: Icons.directions_bike,
    nama: 'Sepeda',
    deskripsi: 'Kendaraan roda dua pribadi',
    isLike: false,
  ),
  const Transports(
    foto: Icons.shopping_cart,
    nama: 'Troli',
    deskripsi: 'Pengangkutan Barang Sorong',
    isLike: false,
  ),
];
