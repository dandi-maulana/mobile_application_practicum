import 'package:flutter/material.dart';

// Data model object produk
class Product {
  final String name;
  final String description;
  final int price;
  final String image;

  Product(this.name, this.description, this.price, this.image);

  static List<Product> getProducts() {
    List<Product> items = <Product>[];
    items.add(
      Product("Laptop A", "Laptop A untuk pekerjaan", 1000, "laptop.png"),
    );
    items.add(
      Product("Laptop B", "Laptop B untuk pekerjaan", 2000, "laptop.png"),
    );
    items.add(
      Product("Laptop C", "Laptop C untuk pekerjaan", 3000, "laptop.png"),
    );
    items.add(
      Product("Laptop D", "Laptop D untuk pekerjaan", 2500, "laptop.png"),
    );
    items.add(
      Product("Laptop E", "Laptop E untuk pekerjaan", 3300, "laptop.png"),
    );
    items.add(
      Product("Laptop F", "Laptop F untuk pekerjaan", 2600, "laptop.png"),
    );

    return items;
  }
}

// Tampilan widget item produk
class ProductBox extends StatelessWidget {
  final Product item;
  final int rating;
  final ValueChanged<int> onRatingChanged;

  const ProductBox({
    super.key,
    required this.item,
    required this.rating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 150,
      child: Card(
        child: Row(
          children: [
            Container(
              width: 150,
              color: Colors.blue,
              child: Center(child: Text(item.image)),
              // child: Image.asset("images/" + item.image)
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(item.description),
                    Text("Harga: ${item.price}"),
                    RatingBox(rating: rating, onRatingChanged: onRatingChanged),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Detail Page
class ProductPage extends StatefulWidget {
  final Product item;
  final int rating;
  final ValueChanged<int> onRatingChanged;

  const ProductPage({
    super.key,
    required this.item,
    required this.rating,
    required this.onRatingChanged,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late int _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }

  void _handleRatingChanged(int newRating) {
    setState(() {
      _rating = newRating;
    });
    widget.onRatingChanged(newRating);
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.green,
              child: Center(child: Text(item.image)),
              // child: Image.asset("images/" + item.image),
            ),
            const SizedBox(height: 10),
            Text(
              item.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(item.description),
            Text("Harga: ${item.price}"),
            RatingBox(rating: _rating, onRatingChanged: _handleRatingChanged),
          ],
        ),
      ),
    );
  }
}

// UI Rating Box
class RatingBox extends StatelessWidget {
  final int rating;
  final ValueChanged<int> onRatingChanged;

  const RatingBox({
    super.key,
    required this.rating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    double _size = 25;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(3, (index) {
        int starIndex = index + 1;
        return IconButton(
          icon: Icon(
            rating >= starIndex ? Icons.star : Icons.star_border,
            size: _size,
          ),
          color: Colors.yellow[800],
          onPressed: () => onRatingChanged(starIndex),
        );
      }),
    );
  }
}

// Page Utama List Data
class MyRatingPage extends StatefulWidget {
  const MyRatingPage({Key? key}) : super(key: key);

  @override
  State<MyRatingPage> createState() => _MyRatingPageState();
}

class _MyRatingPageState extends State<MyRatingPage> {
  final items = Product.getProducts();
  final Map<String, int> ratings = {}; // key: product.name

  void setRating(String name, int rating) {
    setState(() {
      ratings[name] = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Navigation')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            child: ProductBox(
              item: item,
              rating: ratings[item.name] ?? 0,
              onRatingChanged: (rating) => setRating(item.name, rating),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ProductPage(
                        item: item,
                        rating: ratings[item.name] ?? 0,
                        onRatingChanged:
                            (rating) => setRating(item.name, rating),
                      ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
