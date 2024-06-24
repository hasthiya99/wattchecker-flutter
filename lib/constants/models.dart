import 'package:wattchecker/widgets/productcard.dart';

class dummyData {
  static List<ProductCard> getDummyProducts() {
    return [
      ProductCard(
        productName: 'Mobile Phone',
        imageUrl: 'assets/images/laptop.webp',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Fridge',
        imageUrl: 'assets/images/fridge.jpg',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Laptop',
        imageUrl: 'assets/images/laptop.png',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Headphones',
        imageUrl: 'assets/images/headphones.jpg',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Tablet',
        imageUrl: 'assets/images/tablet.png',
        scanDate: DateTime.now(),
      ),
      // Add more dummy data as needed
    ];
  }
}
