import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dihnkit',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const ProductListPage(),
    );
  }
}

class Product {
  final String name;
  final String image;
  final double price;

  const Product({required this.name, required this.image, required this.price});
}

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  final List<Product> products = const [
    Product(
      name: 'Dildo 1',
      image: 'https://tse3.mm.bing.net/th?id=OIP.MInViflWTn0CIsOU3esbLwHaE5&pid=Api&P=0&h=180',
      price: 50.0,
    ),
    Product(
      name: 'Dildo 2',
      image: 'https://tse3.mm.bing.net/th?id=OIP.SFePjxiVA220cC8hFaLx7QHaE5&pid=Api&P=0&h=180',
      price: 30.0,
    ),
    Product(
      name: 'Dildo 3',
      image: 'https://tse3.mm.bing.net/th?id=OIP.MInViflWTn0CIsOU3esbLwHaE5&pid=Api&P=0&h=180',
      price: 25.0,
    ),
    Product(
      name: 'Dildo 4',
      image: 'https://tse3.mm.bing.net/th?id=OIP.SFePjxiVA220cC8hFaLx7QHaE5&pid=Api&P=0&h=180',
      price: 40.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dihnkit'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add search functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for products',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.network(
                          product.image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '₹${product.price.toString()}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Add to cart functionality
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(30),
                          ),
                          child: const Text('Add to Cart'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to cart page
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
