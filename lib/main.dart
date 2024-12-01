import 'package:flutter/material.dart';

void main() => runApp(ClothingStoreApp());

class ClothingStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Store',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'T-Shirt',
      'image': 'https://fasterworkwear.co.nz/cdn/shop/files/Wholesale-Tee-Shirts-Faster-Workwear-and-Design-1684702680.jpg?v=1691561171&width=416',
      'description': 'A comfortable cotton T-shirt.',
      'price': 15.99,
    },
    {
      'name': 'Jeans',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0bIame-AGH3yQqc92IxpqXEmpzkthDeqkR9krr_mgJAFeEXH63oQOzLmz6KKcomQYRSw',
      'description': 'Slim-fit blue jeans.',
      'price': 39.99,
    },
    {
      'name': 'Jacket',
      'image': 'https://img01.ztat.net/article/spp-media-p1/35794882191e44d99e69b84dcf4d7979/3f6988d8163c483b8bb9a1992a8a88a9.jpg?imwidth=762&filter=packshot',
      'description': 'A stylish winter jacket.',
      'price': 79.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Index: 213230')),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, i) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: products[i]),
              ),
            );
          },
          child: Card(
            child: Column(
              children: [
                Image.network(products[i]['image'], fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(products[i]['name']),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name'])),
      body: Column(
        children: [
          Image.network(product['image']),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product['description'],
              style: TextStyle(fontSize: 18),
            ),
          ),
          Text(
            '\$${product['price']}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
