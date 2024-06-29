import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/styles.dart';
import 'package:wattchecker/models/scanned_device.dart';
import 'package:wattchecker/screens/device_details_screen.dart';

class ScannedDeviceCard extends StatelessWidget {
  final ScannedDevice scannedDevice;

  const ScannedDeviceCard({
    super.key,
    required this.scannedDevice
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Format date using intl package
    String formattedDate =
        DateFormat('MMMM dd, yyyy', 'en_US').format(scannedDevice.scannedTime);

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceDetailsScreen(device: scannedDevice.device)));
          },
          child: Container(
            decoration: BoxDecoration(
            boxShadow: [
              defaultShadow(),
              ]
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              child: Container(
                height: screenHeight * 0.25,
                width: screenWidth * 0.4,
                color: Colors.white,
                child: Image.asset(
                  scannedDevice.device.imageUrl,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: screenWidth * 0.4,
          child: Text(
            scannedDevice.device.deviceName,
            style: const TextStyle(
                color: textBlack,
                fontSize: 14,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
            //maxLines: 2, // Set the maximum number of lines
          ),
        ),
        SizedBox(
          width: screenWidth *0.4,
          child: Text(
            formattedDate,
            style: const TextStyle(
                fontSize: 10, 
                color: textGrey, 
                fontFamily: 'Mulish',
              ),
            overflow: TextOverflow.ellipsis,
            //maxLines: 2, // Set the maximum number of lines
          ),
        ),
      ],
    );
  }
}
