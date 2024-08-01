import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/api_response.dart';
import 'package:wattchecker/models/scanned_device.dart';
import 'package:wattchecker/screens/recent_scans.dart';
import 'package:wattchecker/screens/updateuser.dart';
import 'package:wattchecker/services/api.dart';
import 'package:wattchecker/services/shared_prefs.dart';
import 'package:wattchecker/widgets/creditcard.dart';
import 'package:wattchecker/widgets/device_details_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late bool recentScansLoading;
  List<ScannedDevice> scannedDevices = [];

  @override
  void initState() {
    super.initState();
    getRecentScans();
  }

  void getRecentScans() async {
    setState(() {
      recentScansLoading = true;
    });
    ResponseScans response = await Api().getScannedDevices();
    if (!mounted) return;
    scannedDevices = response.scannedDevices;
    setState(() {
      recentScansLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('My Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              )),
        ),
        backgroundColor: appGreen,
        centerTitle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize().width(context)*0.05,
              vertical: 20
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('assets/images/pfp.png')
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${SharedPrefs().getStringValue('firstName') ?? ''} ${SharedPrefs().getStringValue('lastName') ?? ''}",
                            style: const TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 16,
                                color: textBlack,
                                fontWeight: FontWeight.bold)
                            ),
                        Text(SharedPrefs().getStringValue('email') ?? '',
                            style: const TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 14,
                                color: textBlue)
                            ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            appGreen),
                        overlayColor: MaterialStateProperty.all(
                            appBlack.withOpacity(0.05)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0), // Border radius
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Updateuser()));
                      },
                      child: const Text(
                        'Edit',
                        style: TextStyle(color: appWhite),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Dash(
                  dashGap: 0,
                  direction: Axis.horizontal,
                  length: ScreenSize().width(context)*0.9,
                  dashColor: appBlack.withOpacity(0.1),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Saved devices',
                      style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    if (recentScansLoading)
                      const Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.black),
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    else
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecentScans(
                                        scannedDevices: scannedDevices,
                                      )));
                        },
                      ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: scannedDevices.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: DeviceDetailsCard(device: scannedDevices[index].device),
                    );
                  },
                ),
                const SizedBox(height: 30),
                const Text(
                  'Credits',
                  style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const Creditcard(
                  icon: Icons.bolt,
                  iconColor: appCream,
                  backgroundColor: creamCardColor,
                  title: '50',
                  description: 'Credits Earned',
                ),
                const SizedBox(height: 20),
                const Text(
                  'Account Setting',
                  style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Notification',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            color: Colors.grey.shade800),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Privacy',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            color: Colors.grey.shade800),
                      ),
                      const Spacer(), // Pushes the icon to the right corner
                      Icon(
                        Icons.chevron_right, // Greater than icon
                        color: Colors.blue.shade900, // Blue color for the icon
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Security Setting',
                  style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Two-factor authentication ',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              color: Colors.grey.shade800),
                        ),
                        const Spacer(), // Pushes the icon to the right corner
                        Icon(
                          Icons.chevron_right, // Greater than icon
                          color: Colors.blue.shade900, // Blue color for the icon
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/verifyEmail');
                  },
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              color: Colors.grey.shade800),
                        ),
                        const Spacer(), // Pushes the icon to the right corner
                        Icon(
                          Icons.chevron_right, // Greater than icon
                          color: Colors.blue.shade900, // Blue color for the icon
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
