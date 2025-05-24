import 'package:flutter/material.dart';

class AppWisata extends StatelessWidget {
  const AppWisata({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Indonesia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TourismPage(),
    );
  }
}

class TourismPage extends StatefulWidget {
  const TourismPage({super.key});

  @override
  State<TourismPage> createState() => _TourismPageState();
}

class _TourismPageState extends State<TourismPage> {
  final List<Map<String, dynamic>> places = [
    {
      'name': 'Pantai Kuta, Bali',
      'image': 'kuta.jpeg',
      'rating': 0,
      'description':
          'Pantai indah dengan pasir putih dan ombak cocok untuk surfing',
    },
    {
      'name': 'Candi Borobudur',
      'image': 'candi.jpeg',
      'rating': 0,
      'description': 'Warisan budaya dunia dengan arsitektur Buddha yang megah',
    },
    {
      'name': 'Danau Toba, Sumatra',
      'image': 'danau_toba.jpeg',
      'rating': 0,
      'description':
          'Danau vulkanik terbesar di dunia dengan pemandangan menakjubkan',
    },
  ];

  void updateRating(int index, int newRating) {
    setState(() {
      places[index]['rating'] = newRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tempat Wisata Populer'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bagian Gambar
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    'assets/images/${places[index]['image']}',
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 180,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported, size: 50),
                      );
                    },
                  ),
                ),

                // Bagian Konten
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        places[index]['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        places[index]['description'],
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 10),

                      // Rating Section
                      Row(
                        children: [
                          const Text(
                            'Rating: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          // Bintang Rating
                          Row(
                            children: List.generate(5, (starIndex) {
                              return Icon(
                                places[index]['rating'] > starIndex
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.amber,
                                size: 22,
                              );
                            }),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '(${places[index]['rating']}/5)',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      // Tombol Rating
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 5,
                        children: List.generate(5, (starIndex) {
                          int ratingValue = starIndex + 1;
                          return ElevatedButton(
                            onPressed: () => updateRating(index, ratingValue),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              backgroundColor: Colors.blue[50],
                              foregroundColor: Colors.blue,
                            ),
                            child: Text(
                              '$ratingValue Bintang',
                              style: const TextStyle(fontSize: 12),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
