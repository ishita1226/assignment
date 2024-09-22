import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Product model class
class ProductModel {
  final String name;
  final String description;
  final double originalPrice;
  final double discountedPrice;
  final double discountPercentage;

  ProductModel({
    required this.name,
    required this.description,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountPercentage,
  });
}

// Product provider class to manage state
class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [
    ProductModel(
      name: 'iPhone 9',
      description: 'An apple mobile which is nothing like apple...',
      originalPrice: 644,
      discountedPrice: 499,
      discountPercentage: 12.98,
    ),
    ProductModel(
      name: 'iPhone 9',
      description: 'An apple mobile which is nothing like apple...',
      originalPrice: 644,
      discountedPrice: 499,
      discountPercentage: 12.98,
    ),
    ProductModel(
      name: 'iPhone 9',
      description: 'An apple mobile which is nothing like apple...',
      originalPrice: 644,
      discountedPrice: 499,
      discountPercentage: 12.98,
    ),
    ProductModel(
      name: 'iPhone 9',
      description: 'An apple mobile which is nothing like apple...',
      originalPrice: 644,
      discountedPrice: 499,
      discountPercentage: 12.98,
    ),
  ];

  List<ProductModel> get products => _products;
}

// Main screen widget
class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).products;

    return Scaffold(
      appBar: AppBar(
        title: Text('e-Shop'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // For small screens, use ListView, for large screens use GridView
          if (constraints.maxWidth < 600) {
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            );
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns for large screens
                childAspectRatio: 3 / 4, // Adjust card height
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            );
          }
        },
      ),
    );
  }
}

// Widget to display individual product card
class ProductCard extends StatelessWidget {
  final ProductModel product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder image for product
          Image.asset(
            'assets/imgs/iphone.jpeg', // Replace with actual image if available
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.discountedPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${product.discountPercentage.toStringAsFixed(2)}% off',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text(
              '\$${product.originalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
