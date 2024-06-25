import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/dummy_data.dart';
import 'package:wattchecker/widgets/productcard.dart';
import 'package:wattchecker/widgets/tip_card.dart';
import 'package:wattchecker/widgets/videocard.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductCard> products = []; // Initialize as an empty list

  @override
  void initState() {
    super.initState();
    // Initialize products list with dummy data
    products = getDummyProducts();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: BottomRightRoundedClipper(),
              child: Stack(
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
                          const Text(
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
                              child: const Text(
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
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search for product',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Mulish',
                                        color: Color(0xFFB4BDC4),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                      prefixIcon: Icon(Icons.search,
                                          size: 16, color: Colors.black),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(10),
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

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Scan',
                        style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/recentScans');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
            
                  // Use a conditional widget to handle null products
                  products.isEmpty
                      ? const CircularProgressIndicator(color: appBlack,) // Show loading indicator or handle as per your UI
                      : SizedBox(
                          height: screenHeight * 0.3,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SizedBox(
                                  width: screenWidth * 0.4,
                                  child: products[index],
                                ),
                              );
                            },
                          ),
                        ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Quick Tips for You',
                        style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/quickTips');
                        },
                      ),
                    ],
                  ),
                  const Text(
                    'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text',
                    style: TextStyle(
                        fontSize: 13, color: Colors.grey, fontFamily: 'Inter'),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2, // Set the maximum number of lines
                  ),
                  const SizedBox(height: 8),
                  const TipCard(
                    icon: Icons.thermostat,
                    iconColor: appGreen,
                    backgroundColor: greenCardColor,
                    title: 'Tip 01',
                    description:
                        'Adjust fridge temperature by 2°F to save up to 15% on energy usage.',
                  ),
                  const TipCard(
                    icon: Icons.lightbulb,
                    iconColor: appCream,
                    backgroundColor: creamCardColor,
                    title: 'Tip 02',
                    description:
                        'Power down those electronics: Standby power drain adds up. Turn them off!',
                  ),
                  const TipCard(
                    icon: Icons.power_off,
                    iconColor: appGreen,
                    backgroundColor: greenCardColor,
                    title: 'Tip 03',
                    description:
                        'Power down those electronics: Standby power drain adds up. Turn them off!',
                  ),
                  const TipCard(
                    icon: Icons.lightbulb,
                    iconColor: appCream,
                    backgroundColor: creamCardColor,
                    title: 'Tip 04',
                    description:
                        'Power down those electronics: Standby power drain adds up. Turn them off!',
                  ),
                  const TipCard(
                    icon: Icons.thermostat,
                    iconColor: appGreen,
                    backgroundColor: greenCardColor,
                    title: 'Tip 05',
                    description:
                        'Power down those electronics: Standby power drain adds up. Turn them off!',
                  ),
                  const SizedBox(height: 15),
                  const Videocard(
                      videoName: 'How to Save Energy In The kitchen',
                      videoUrl:
                          'https://videos.pexels.com/video-files/6996473/6996473-uhd_2560_1440_30fps.mp4',
                      description:
                          'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text'),
                  const SizedBox(height: 8),
                  const Videocard(
                      videoName: 'How to Save Energy In The kitchen',
                      videoUrl:
                          'https://media.istockphoto.com/id/1292468199/video/close-up-hands-turn-on-and-off-light-pushing-the-button.mp4?s=mp4-640x640-is&k=20&c=TojXNKbbDFvvvPibG7SYcQPARvuUHVK7frONfv6Uck0=',
                      description:
                          'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text')
                ],
              ),
            ),
            const SizedBox(height: 200,)
          ],
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
