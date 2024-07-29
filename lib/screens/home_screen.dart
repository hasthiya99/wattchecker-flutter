import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/constants/styles.dart';
import 'package:wattchecker/models/api_response.dart';
import 'package:wattchecker/models/scanned_device.dart';
import 'package:wattchecker/screens/recent_scans.dart';
import 'package:wattchecker/services/api.dart';
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

  late String firstName;
  late bool recentScansLoading;
  List<ScannedDevice> scannedDevices = [];

  @override
  void initState() {
    super.initState();
    firstName = SharedPrefs().getStringValue('firstName')??'User';
    getRecentScans();
  }

  void getRecentScans() async {
    setState(() {
      recentScansLoading = true;
    });
    ResponseScans response = await Api().getScannedDevices();
    scannedDevices = response.scannedDevices;
    setState(() {
      recentScansLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[
              createSilverAppBar1(),
              createSilverAppBar2()
            ];
          },
          body: ListView(
            children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 200),
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
                      if (recentScansLoading) const Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                                  strokeWidth: 2,
                              ),
                        ),
                      ) 
                      else IconButton(
                        icon: const Icon(
                          Icons.arrow_forward,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RecentScans(scannedDevices: scannedDevices,)));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
            
                  //Use a conditional widget to handle null products
                  if 
                    (scannedDevices.isEmpty) 
                    const Text('No scanned devices yet',
                      style: TextStyle(fontSize: 13, color: Colors.grey, fontFamily: 'Inter')
                    ) 
                  else 
                    SizedBox(
                          height: ScreenSize().height(context) * 0.3,
                          width: ScreenSize().width(context),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: scannedDevices.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: ScannedDeviceCard(
                                  scannedDevice: scannedDevices[index],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Video Training',
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
                          //Navigate to Video Training
                        },
                      ),
                    ],
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
            ],
          )
        ),
      ),
    );
  }


  SliverAppBar createSilverAppBar1() {
    return SliverAppBar(
      backgroundColor: appGreen,
      expandedHeight: 130,
      floating: false,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Padding(
                padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context)*0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        width: ScreenSize().width(context),
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
                  ],
                ),
              ),
            );
          }),
    );
  }

  SliverAppBar createSilverAppBar2() {
    return SliverAppBar(
      backgroundColor: appGreen,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
        ),
      ),
      pinned: true,

      bottom: const PreferredSize(                      
                preferredSize: Size.fromHeight(10.0),     
                child: Text(''),
              ),   
      flexibleSpace: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context)*0.05),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      defaultShadow()
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
        ),
      ),
    );
  }
}
