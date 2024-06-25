import 'package:flutter/material.dart';
import 'package:wattchecker/constants/screensize.dart';
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const FeaturePageAppBar(
          title: 'Recent Scans',
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context) * 0.05, vertical: 20.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: ScreenSize().width(context) * 0.05,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.65,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return productCards[index];
                  },
                  childCount: productCards.length,
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
