import 'package:flutter/material.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/productcard.dart';

class RecentScans extends StatefulWidget {
  const RecentScans({super.key});

  @override
  State<RecentScans> createState() => _RecentScansState();
}

class _RecentScansState extends State<RecentScans> {
  @override
  Widget build(BuildContext context) {
    List<ProductCard> productCards = [
      ProductCard(
        productName: 'Product Name',
        imageUrl: 'assets/images/laptop.webp',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product Name',
        imageUrl: 'assets/images/fridgenew.jpg',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product Name',
        imageUrl: 'assets/images/laptop.webp',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product Name',
        imageUrl: 'assets/images/fridgenew.jpg',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product Name',
        imageUrl: 'assets/images/fridgenew.jpg',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product Name',
        imageUrl: 'assets/images/fridgenew.jpg',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product Name',
        imageUrl: 'assets/images/fridgenew.jpg',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product Name',
        imageUrl: 'assets/images/fridgenew.jpg',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product Name',
        imageUrl: 'assets/images/fridgenew.jpg',
        scanDate: DateTime.now(),
      ),
      // Add more ProductCard widgets here as needed
    ];

    return Scaffold(
      appBar: const FeaturePageAppBar(
        title: '',
      ),
      body: Padding(
        padding: const EdgeInsets.all(.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                    horizontal: 27.0), // Add horizontal padding
                itemCount: productCards.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0, // Space between columns
                  mainAxisSpacing: 16.0, // Space between rows
                  childAspectRatio: 0.65, // Adjust as needed
                ),
                itemBuilder: (context, index) {
                  return productCards[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
