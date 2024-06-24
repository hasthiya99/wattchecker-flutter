// import 'package:flutter/material.dart';
// import 'package:wattchecker/widgets/appbar.dart';
// import 'package:wattchecker/widgets/scancard.dart';

// class scanproducts extends StatefulWidget {
//   const scanproducts({super.key});

//   @override
//   State<scanproducts> createState() => _scanproductsState();
// }

// class _scanproductsState extends State<scanproducts> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: StandardAppBar(
//         title: 'Scan Product',
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               ScanProductCard(
//                 productName: 'Product Name',
//                 imageUrl: 'assets/images/fridge.jpg',
//                 Energyusage: '120',
//                 Energycost: '120',
//                 modelnumber: '123456789i',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/productcard.dart';
import 'package:wattchecker/widgets/scancard.dart';

class scanproducts extends StatefulWidget {
  const scanproducts({super.key});

  @override
  State<scanproducts> createState() => _scanproductsState();
}

class _scanproductsState extends State<scanproducts> {
  @override
  Widget build(BuildContext context) {
    List<ScanProductCard> ScanProductCards = [
      ScanProductCard(
        productName: 'Product Name',
        imageUrl: 'assets/images/fridge.jpg',
        Energyusage: '120',
        Energycost: '120',
        modelnumber: '123456789i',
      ),
      ScanProductCard(
        productName: 'Product Name',
        imageUrl: 'assets/images/fridge.jpg',
        Energyusage: '120',
        Energycost: '120',
        modelnumber: '123456789i',
      ),
      ScanProductCard(
        productName: 'Product Name',
        imageUrl: 'assets/images/fridge.jpg',
        Energyusage: '120',
        Energycost: '120',
        modelnumber: '123456789i',
      ),
      ScanProductCard(
        productName: 'Product Name',
        imageUrl: 'assets/images/fridge.jpg',
        Energyusage: '120',
        Energycost: '120',
        modelnumber: '123456789i',
      ),
      ScanProductCard(
        productName: 'Product Name',
        imageUrl: 'assets/images/fridge.jpg',
        Energyusage: '120',
        Energycost: '120',
        modelnumber: '123456789i',
      ),

      // Add more ProductCard widgets here as needed
    ];

    return Scaffold(
      appBar: StandardAppBar(
        title: 'Scan Product',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: ScanProductCards.map((card) => Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: card,
                )).toList(),
          ),
        ),
      ),
    );
  }
}
