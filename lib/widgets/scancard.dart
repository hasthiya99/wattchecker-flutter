// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class ScanProductCard extends StatefulWidget {
//   final String productName;
//   final String modelnumber;
//   final String Energyusage;
//   final String Energycost;
//   final String imageUrl;

//   const ScanProductCard({
//     Key? key,
//     required this.productName,
//     required this.imageUrl,
//     required this.Energyusage,
//     required this.Energycost,
//     required this.modelnumber,
//   }) : super(key: key);

//   @override
//   State<ScanProductCard> createState() => _ScanProductCardState();
// }

// class _ScanProductCardState extends State<ScanProductCard> {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     // Format date using intl package

//     return Container(
//       height: screenHeight * 0.25,
//       width: screenWidth * 0.9,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             spreadRadius: 5,
//             blurRadius: 7,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Column(
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: screenHeight * 0.2,
//                   width: screenWidth * 0.3,
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(10.0),
//                     ),
//                     child: Image.asset(
//                       widget.imageUrl,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(width: 20),
//             SizedBox(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         widget.productName,
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w600),
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         'Model number: ',
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w300),
//                       ),
//                       Text(
//                         widget.modelnumber,
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w600),
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         'Energy Usage: ',
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w300),
//                       ),
//                       Text(
//                         widget.Energyusage,
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w600),
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         'Estimated Cost: ',
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w300),
//                       ),
//                       Text(
//                         '\$',
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w600),
//                       ),
//                       Text(
//                         widget.Energycost as String,
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w600),
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//             // Row(
//             //   children: [
//             //     SizedBox(
//             //       height: screenHeight * 0.2,
//             //       width: screenWidth * 0.3,
//             //       child: ClipRRect(
//             //         borderRadius: const BorderRadius.all(
//             //           Radius.circular(10.0),
//             //         ),
//             //         child: Image.asset(
//             //           widget.imageUrl,
//             //           fit: BoxFit.cover,
//             //         ),
//             //       ),
//             //     ),
//             //     const SizedBox(width: 20),
//             //     SizedBox(
//             //       child: Expanded(
//             //         child: Column(
//             //           crossAxisAlignment: CrossAxisAlignment.start,
//             //           children: [
//             //             Row(
//             //               children: [
//             //                 Text(
//             //                   widget.productName,
//             //                   style: const TextStyle(
//             //                       fontSize: 15, fontWeight: FontWeight.w600),
//             //                   overflow: TextOverflow.ellipsis,
//             //                   maxLines: 2,
//             //                 ),
//             //               ],
//             //             ),
//             //             Row(
//             //               children: [
//             //                 Text(
//             //                   'Model number: ',
//             //                   style: const TextStyle(
//             //                       fontSize: 12, fontWeight: FontWeight.w300),
//             //                 ),
//             //                 Text(
//             //                   widget.productName,
//             //                   style: const TextStyle(
//             //                       fontSize: 12, fontWeight: FontWeight.w600),
//             //                   overflow: TextOverflow.ellipsis,
//             //                   maxLines: 2,
//             //                 ),
//             //               ],
//             //             ),
//             //             Row(
//             //               children: [
//             //                 Text(
//             //                   'Energy Usage: ',
//             //                   style: const TextStyle(
//             //                       fontSize: 12, fontWeight: FontWeight.w300),
//             //                 ),
//             //                 Text(
//             //                   widget.Energyusage,
//             //                   style: const TextStyle(
//             //                       fontSize: 12, fontWeight: FontWeight.w600),
//             //                   overflow: TextOverflow.ellipsis,
//             //                   maxLines: 2,
//             //                 ),
//             //               ],
//             //             ),
//             //             Row(
//             //               children: [
//             //                 Text(
//             //                   'Estimated Cost: ',
//             //                   style: const TextStyle(
//             //                       fontSize: 12, fontWeight: FontWeight.w300),
//             //                 ),
//             //                 Text(
//             //                   '\$',
//             //                   style: const TextStyle(
//             //                       fontSize: 12, fontWeight: FontWeight.w600),
//             //                 ),
//             //                 Text(
//             //                   widget.Energycost,
//             //                   style: const TextStyle(
//             //                       fontSize: 12, fontWeight: FontWeight.w600),
//             //                   overflow: TextOverflow.ellipsis,
//             //                   maxLines: 2,
//             //                 ),
//             //               ],
//             //             ),
//             //           ],
//             //         ),
//             //       ),
//             //     ),
//             //   ],
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScanProductCard extends StatefulWidget {
  final String productName;
  final String modelnumber;
  final String Energyusage;
  final String Energycost;
  final String imageUrl;

  const ScanProductCard({
    Key? key,
    required this.productName,
    required this.imageUrl,
    required this.Energyusage,
    required this.Energycost,
    required this.modelnumber,
  }) : super(key: key);

  @override
  State<ScanProductCard> createState() => _ScanProductCardState();
}

class _ScanProductCardState extends State<ScanProductCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: screenHeight * 0.25,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.3,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          child: Image.asset(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          widget.productName,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Model number: ',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                            Expanded(
                              child: Text(
                                widget.modelnumber,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Energy Usage: ',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                            Expanded(
                              child: Text(
                                widget.Energyusage,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Estimated Cost: ',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                            const Text(
                              '\$',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Expanded(
                              child: Text(
                                widget.Energycost,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
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
            if (isSelected)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
