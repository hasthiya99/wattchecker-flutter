// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:wattchecker/constants/colors.dart';
// import 'package:wattchecker/constants/dummy_data.dart';
// import 'package:wattchecker/constants/screensize.dart';
// import 'package:wattchecker/constants/styles.dart';
// import 'package:wattchecker/models/scanned_device.dart';
// import 'package:wattchecker/models/video.dart';
// import 'package:wattchecker/widgets/scanned_device_card.dart';
// import 'package:wattchecker/widgets/tip_card.dart';
// import 'package:wattchecker/widgets/videocard.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<ScannedDevice> products = []; // Initialize as an empty list

//   @override
//   void initState() {
//     super.initState();
//     // Initialize products list with dummy data
//     products = scannedDevices;
//     fetchVideos();
//   }

//   List<Video> videos = [];

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   fetchVideos();
//   // }

//   Future<void> fetchVideos() async {
//     try {
//       final response =
//           await Dio().get('https://watch.hasthiya.org/video/getvideos');
//       if (response.statusCode == 200) {
//         final data = response.data as Map<String, dynamic>;
//         final videoList = data['result'] as List<dynamic>;
//         setState(() {
//           videos =
//               videoList.map((videoJson) => Video.fromJson(videoJson)).toList();
//         });
//       } else {
//         // Handle the error
//         print('Failed to load videos');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             height: 300,
//             decoration: const BoxDecoration(
//                 color: appGreen,
//                 borderRadius:
//                     BorderRadius.only(bottomRight: Radius.circular(20))),
//             child: Stack(
//               children: [
//                 Positioned(
//                     left: -120,
//                     bottom: 0,
//                     child: SvgPicture.asset(
//                       'assets/images/appbar_pattern.svg',
//                       width: 250,
//                       height: 250,
//                     )),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: ScreenSize().width(context) * 0.05),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       const Text(
//                         'Hi,Samadhi',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Inter',
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(top: 8, bottom: 8, right: 8),
//                         child: SizedBox(
//                           width: screenWidth,
//                           child: const Text(
//                             'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontFamily: 'Inter',
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w400),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [defaultShadow()],
//                               ),
//                               child: const TextField(
//                                 decoration: InputDecoration(
//                                   hintText: 'Search for product',
//                                   hintStyle: TextStyle(
//                                     fontFamily: 'Mulish',
//                                     color: Color(0xFFB4BDC4),
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 14,
//                                   ),
//                                   prefixIcon: Icon(Icons.search,
//                                       size: 16, color: Colors.black),
//                                   border: InputBorder.none,
//                                   contentPadding: EdgeInsets.all(10),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//                 left: 20, right: 20, top: 20, bottom: 200),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Recent Scan',
//                       style: TextStyle(
//                           fontFamily: 'Lexend',
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     IconButton(
//                       icon: const Icon(
//                         Icons.arrow_forward,
//                       ),
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/recentScans');
//                       },
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),

//                 //Use a conditional widget to handle null products
//                 if (products.isEmpty)
//                   const CircularProgressIndicator(
//                     color: appBlack,
//                   )
//                 else
//                   SizedBox(
//                     height: screenHeight * 0.3,
//                     width: screenWidth,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: products.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(right: 20.0),
//                           child: ScannedDeviceCard(
//                             scannedDevice: products[index],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 const SizedBox(height: 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Quick Tips for You',
//                       style: TextStyle(
//                           fontFamily: 'Lexend',
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     IconButton(
//                       icon: const Icon(
//                         Icons.arrow_forward,
//                       ),
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/quickTips');
//                       },
//                     ),
//                   ],
//                 ),
//                 const Text(
//                   'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text',
//                   style: TextStyle(
//                       fontSize: 13, color: Colors.grey, fontFamily: 'Inter'),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 2, // Set the maximum number of lines
//                 ),
//                 const SizedBox(height: 8),
//                 const TipCard(
//                   icon: Icons.thermostat,
//                   iconColor: appGreen,
//                   backgroundColor: greenCardColor,
//                   title: 'Tip 01',
//                   description:
//                       'Adjust fridge temperature by 2°F to save up to 15% on energy usage.',
//                 ),
//                 const TipCard(
//                   icon: Icons.lightbulb,
//                   iconColor: appCream,
//                   backgroundColor: creamCardColor,
//                   title: 'Tip 02',
//                   description:
//                       'Power down those electronics: Standby power drain adds up. Turn them off!',
//                 ),
//                 const TipCard(
//                   icon: Icons.power_off,
//                   iconColor: appGreen,
//                   backgroundColor: greenCardColor,
//                   title: 'Tip 03',
//                   description:
//                       'Power down those electronics: Standby power drain adds up. Turn them off!',
//                 ),
//                 const TipCard(
//                   icon: Icons.lightbulb,
//                   iconColor: appCream,
//                   backgroundColor: creamCardColor,
//                   title: 'Tip 04',
//                   description:
//                       'Power down those electronics: Standby power drain adds up. Turn them off!',
//                 ),
//                 const TipCard(
//                   icon: Icons.thermostat,
//                   iconColor: appGreen,
//                   backgroundColor: greenCardColor,
//                   title: 'Tip 05',
//                   description:
//                       'Power down those electronics: Standby power drain adds up. Turn them off!',
//                 ),
//                 const SizedBox(height: 15),

//                 if (videos.isEmpty)
//                   const CircularProgressIndicator(
//                     color: appBlack,
//                   )
//                 else
//                   ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: videos.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Videocard(
//                           videoName: videos[index].videoName,
//                           videoUrl: videos[index].videoUrl,
//                           description: videos[index].description,
//                         ),
//                       );
//                     },
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/dummy_data.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/constants/styles.dart';
import 'package:wattchecker/models/scanned_device.dart';
import 'package:wattchecker/models/video.dart';
import 'package:wattchecker/services/shared_prefs.dart';
import 'package:wattchecker/widgets/scanned_device_card.dart';
import 'package:wattchecker/widgets/tip_card.dart';
import 'package:wattchecker/widgets/videocard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ScannedDevice> products = []; // Initialize as an empty list
  late String firstName;

  @override
  void initState() {
    // Initialize products list with dummy data
    products = scannedDevices;
    firstName = SharedPrefs().getStringValue('firstName') ?? 'User';
    fetchVideos();
    super.initState();
  }

  List<Video> videos = [];
  Future<void> fetchVideos() async {
    try {
      final response =
          await Dio().get('https://watch.hasthiya.org/video/getvideos');
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final videoList = data['result'] as List<dynamic>;
        setState(() {
          videos =
              videoList.map((videoJson) => Video.fromJson(videoJson)).toList();
        });
      } else {
        // Handle the error
        print('Failed to load videos');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
                color: appGreen,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(20))),
            child: Stack(
              children: [
                Positioned(
                    left: -120,
                    bottom: 0,
                    child: SvgPicture.asset(
                      'assets/images/appbar_pattern.svg',
                      width: 250,
                      height: 250,
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize().width(context) * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Hi, $firstName',
                        style: const TextStyle(
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
                                boxShadow: [defaultShadow()],
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
            padding: const EdgeInsets.only(
                left: 20, right: 20, top: 20, bottom: 200),
            child: Column(
              mainAxisSize: MainAxisSize.max,
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

                //Use a conditional widget to handle null products
                if (products.isEmpty)
                  const CircularProgressIndicator(
                    color: appBlack,
                  )
                else
                  SizedBox(
                    height: screenHeight * 0.3,
                    width: screenWidth,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: ScannedDeviceCard(
                            scannedDevice: products[index],
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
                if (videos.isEmpty)
                  const CircularProgressIndicator(
                    color: appBlack,
                  )
                else
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Videocard(
                          videoName: videos[index].videoName,
                          videoUrl: videos[index].videoUrl,
                          description: videos[index].description,
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
