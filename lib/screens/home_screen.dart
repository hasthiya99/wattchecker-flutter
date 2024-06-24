import 'package:flutter/material.dart';
import 'package:wattchecker/screens/recently_scan.dart';
import 'package:wattchecker/widgets/productcard.dart';

class DummyData {
  static List<ProductCard> getDummyProducts() {
    return [
      ProductCard(
        productName: 'Mobile Phone',
        imageUrl: 'assets/images/mobilephone.jpg',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Fridge',
        imageUrl: 'assets/images/fridge.jpg',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Laptop',
        imageUrl: 'assets/images/laptop.webp',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Headphones',
        imageUrl: 'assets/images/headset.webp',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Tablet',
        imageUrl: 'assets/images/tablet.jpg',
        scanDate: DateTime.now(),
      ),
    ];
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductCard> products = []; // Initialize as an empty list

  @override
  void initState() {
    super.initState();
    // Initialize products list with dummy data
    products = DummyData.getDummyProducts();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: ClipPath(
          clipper: BottomRightRoundedClipper(),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Stack(
              children: [
                Image.asset(
                  'assets/images/Frame.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, I am Samadhi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                        child: SizedBox(
                          width: screenWidth,
                          child: Text(
                            'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text ',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Scan',
                    style: const TextStyle(
                        fontFamily: 'Lexend',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RecentlyScan(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Use a conditional widget to handle null products
              products.isEmpty
                  ? CircularProgressIndicator() // Show loading indicator or handle as per your UI
                  : SizedBox(
                      height: screenHeight * 0.6,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: SizedBox(
                              width: screenWidth * 0.4,
                              child: products[index],
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomRightRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(
        size.width - 30, size.height); // Move the path left for the curve
    path.quadraticBezierTo(size.width, size.height, size.width,
        size.height - 30); // Bottom-right rounded corner
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
