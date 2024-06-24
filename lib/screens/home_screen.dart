import 'package:flutter/material.dart';
import 'package:wattchecker/screens/recently_scan.dart';
import 'package:wattchecker/screens/tips_screen.dart';
import 'package:wattchecker/widgets/productcard.dart';
import 'package:wattchecker/widgets/videocard.dart';

class DummyData {
  static List<ProductCard> getDummyProducts() {
    return [
      ProductCard(
        productName: 'Product name',
        imageUrl: 'assets/images/mobilephone.jpg',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product name',
        imageUrl: 'assets/images/fridgenew.jpg',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product name',
        imageUrl: 'assets/images/laptop.webp',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product name',
        imageUrl: 'assets/images/headset.webp',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product name',
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
                  'assets/images/feature_appbar.png',
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
                        'Hi,Samadhi',
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
                            'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search for product',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Mulish',
                                    color: Color(0xFFB4BDC4),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                  prefixIcon: const Icon(Icons.search,
                                      size: 16, color: Colors.black),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(10),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                      height: screenHeight * 0.3,
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
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quick Tips for You',
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
                          builder: (context) => TipsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Text(
                'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text',
                style: const TextStyle(
                    fontSize: 13, color: Colors.grey, fontFamily: 'Inter'),
                overflow: TextOverflow.ellipsis,
                maxLines: 2, // Set the maximum number of lines
              ),
              SizedBox(height: 8),
              GreenTipCard(
                icon: Icons.thermostat,
                title: 'Tip 01',
                description:
                    'Adjust fridge temperature by 2°F to save up to 15% on energy usage.',
              ),
              OrangeTipCard(
                icon: Icons.lightbulb,
                title: 'Tip 02',
                description:
                    'Power down those electronics: Standby power drain adds up. Turn them off!',
              ),
              GreenTipCard(
                icon: Icons.power_off,
                title: 'Tip 03',
                description:
                    'Power down those electronics: Standby power drain adds up. Turn them off!',
              ),
              OrangeTipCard(
                icon: Icons.lightbulb,
                title: 'Tip 04',
                description:
                    'Power down those electronics: Standby power drain adds up. Turn them off!',
              ),
              GreenTipCard(
                icon: Icons.thermostat,
                title: 'Tip 05',
                description:
                    'Power down those electronics: Standby power drain adds up. Turn them off!',
              ),
              SizedBox(height: 15),
              Videocard(
                  videoName: 'How to Save Energy In The kitchen',
                  videoUrl:
                      'https://videos.pexels.com/video-files/6996473/6996473-uhd_2560_1440_30fps.mp4',
                  description:
                      'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text'),
              SizedBox(height: 8),
              Videocard(
                  videoName: 'How to Save Energy In The kitchen',
                  videoUrl:
                      'https://media.istockphoto.com/id/1292468199/video/close-up-hands-turn-on-and-off-light-pushing-the-button.mp4?s=mp4-640x640-is&k=20&c=TojXNKbbDFvvvPibG7SYcQPARvuUHVK7frONfv6Uck0=',
                  description:
                      'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text')
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
