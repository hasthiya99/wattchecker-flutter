// // // import 'package:flutter/material.dart';
// // // import 'package:wattchecker/constants/dummy_data.dart';
// // // import 'package:wattchecker/constants/screensize.dart';
// // // import 'package:wattchecker/models/scanned_device.dart';
// // // import 'package:wattchecker/widgets/appbar.dart';
// // // import 'package:wattchecker/widgets/scanned_device_card.dart';

// // // class RecentScans extends StatefulWidget {
// // //   const RecentScans({super.key});

// // //   @override
// // //   State<RecentScans> createState() => _RecentScansState();
// // // }

// // // class _RecentScansState extends State<RecentScans> {

// // //   List<ScannedDevice> devices = scannedDevices;

// // //   @override
// // //   Widget build(BuildContext context) {

// // //     return GestureDetector(
// // //       onTap: () => FocusScope.of(context).unfocus(),
// // //       child: Scaffold(
// // //         appBar: const FeaturePageAppBar(
// // //           title: 'Recent Scans',
// // //         ),
// // //         body: CustomScrollView(
// // //           slivers: [
// // //             SliverPadding(
// // //               padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context) * 0.05, vertical: 20.0),
// // //               sliver: SliverGrid(
// // //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // //                   crossAxisCount: 2,
// // //                   crossAxisSpacing: ScreenSize().width(context) * 0.05,
// // //                   mainAxisSpacing: 16.0,
// // //                   childAspectRatio: 0.65,
// // //                 ),
// // //                 delegate: SliverChildBuilderDelegate(
// // //                   (context, index) {
// // //                     return ScannedDeviceCard(
// // //                       scannedDevice: devices[index],
// // //                     );
// // //                   },
// // //                   childCount: devices.length,
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         )
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:dio/dio.dart';
// // import 'package:flutter/material.dart';
// // import 'package:wattchecker/constants/screensize.dart';
// // import 'package:wattchecker/models/scanned_device.dart';
// // import 'package:wattchecker/widgets/appbar.dart';
// // import 'package:wattchecker/widgets/scanned_device_card.dart';

// // class RecentScans extends StatefulWidget {
// //   const RecentScans({super.key});

// //   @override
// //   State<RecentScans> createState() => _RecentScansState();
// // }

// // class _RecentScansState extends State<RecentScans> {
// //   List<ScannedDevice> devices = [];
// //   bool isLoading = true;

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchScannedDevices();
// //   }

// //   Future<void> fetchScannedDevices() async {
// //     try {
// //       final response = await Dio()
// //           .get('http://watch.hasthiya.org/api/products/getAllProducts');
// //       if (response.statusCode == 200) {
// //         final List<dynamic> data = response.data;
// //         setState(() {
// //           devices = data.map((json) => ScannedDevice.fromJson(json)).toList();
// //           isLoading = false;
// //         });
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(
// //             content: Text('Fetching successful'),
// //             backgroundColor: Colors.green,
// //           ),
// //         );
// //       } else {
// //         throw Exception('Failed to load scanned devices');
// //       }
// //     } catch (e) {
// //       setState(() {
// //         isLoading = false;
// //       });
// //       print('Error: $e');
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text('Error: $e'),
// //           backgroundColor: Colors.red,
// //         ),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () => FocusScope.of(context).unfocus(),
// //       child: Scaffold(
// //         appBar: const FeaturePageAppBar(
// //           title: 'Recent Scans',
// //         ),
// //         body: isLoading
// //             ? const Center(child: CircularProgressIndicator())
// //             : CustomScrollView(
// //                 slivers: [
// //                   SliverPadding(
// //                     padding: EdgeInsets.symmetric(
// //                       horizontal: ScreenSize().width(context) * 0.05,
// //                       vertical: 20.0,
// //                     ),
// //                     sliver: SliverGrid(
// //                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                         crossAxisCount: 2,
// //                         crossAxisSpacing: ScreenSize().width(context) * 0.05,
// //                         mainAxisSpacing: 16.0,
// //                         childAspectRatio: 0.65,
// //                       ),
// //                       delegate: SliverChildBuilderDelegate(
// //                         (context, index) {
// //                           return ScannedDeviceCard(
// //                             scannedDevice: devices[index],
// //                           );
// //                         },
// //                         childCount: devices.length,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //       ),
// //     );
// //   }
// // }
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:wattchecker/constants/screensize.dart';
// import 'package:wattchecker/models/scanned_device.dart';
// import 'package:wattchecker/widgets/appbar.dart';
// import 'package:wattchecker/widgets/scanned_device_card.dart';

// class RecentScans extends StatefulWidget {
//   const RecentScans({super.key});

//   @override
//   State<RecentScans> createState() => _RecentScansState();
// }

// class _RecentScansState extends State<RecentScans> {
//   List<ScannedDevice> devices = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchScannedDevices();
//   }

//   Future<void> fetchScannedDevices() async {
//     try {
//       final response = await Dio()
//           .get('https://watch.hasthiya.org/api/products/getAllProducts');
//       if (response.statusCode == 200) {
//         final data = response.data as Map<String, dynamic>;
//         final List<dynamic> results = data['result'] ?? [];
//         setState(() {
//           devices = results
//               .where((json) => json != null && json is Map<String, dynamic>)
//               .map((json) =>
//                   ScannedDevice.fromJson(json as Map<String, dynamic>))
//               .toList();
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load scanned devices');
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         appBar: const FeaturePageAppBar(
//           title: 'Recent Scans',
//         ),
//         body: isLoading
//             ? const Center(child: CircularProgressIndicator())
//             : CustomScrollView(
//                 slivers: [
//                   SliverPadding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: ScreenSize().width(context) * 0.05,
//                       vertical: 20.0,
//                     ),
//                     sliver: SliverGrid(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: ScreenSize().width(context) * 0.05,
//                         mainAxisSpacing: 16.0,
//                         childAspectRatio: 0.65,
//                       ),
//                       delegate: SliverChildBuilderDelegate(
//                         (context, index) {
//                           return ScannedDeviceCard(
//                             scannedDevice: devices[index],
//                           );
//                         },
//                         childCount: devices.length,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/scanned_device.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/scanned_device_card.dart';

class RecentScans extends StatefulWidget {
  const RecentScans({super.key});

  @override
  State<RecentScans> createState() => _RecentScansState();
}

class _RecentScansState extends State<RecentScans> {
  List<ScannedDevice> devices = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchScannedDevices();
  }

  Future<void> fetchScannedDevices() async {
    try {
      final response = await Dio()
          .get('https://watch.hasthiya.org/api/products/getAllProducts');
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final List<dynamic> results = data['result'] ?? [];
        setState(() {
          devices = results
              .where((json) => json != null && json is Map<String, dynamic>)
              .map((json) =>
                  ScannedDevice.fromJson(json as Map<String, dynamic>))
              .toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load scanned devices');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const FeaturePageAppBar(
          title: 'Recent Scans',
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize().width(context) * 0.05,
                      vertical: 20.0,
                    ),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: ScreenSize().width(context) * 0.05,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 0.65,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return ScannedDeviceCard(
                            scannedDevice: devices[index],
                          );
                        },
                        childCount: devices.length,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
