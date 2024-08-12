import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/constants/styles.dart';
import 'package:wattchecker/services/shared_prefs.dart';
import 'package:wattchecker/widgets/tip_card.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  late String firstName;

  @override
  void initState() {
    super.initState();
    firstName = SharedPrefs().getStringValue('firstName') ?? 'User';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        // drawer: const AppDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[createSilverAppBar1(), createSilverAppBar2()];
          },
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      // // Dummy text
                      // const Text(
                      //   'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text',
                      //   style: TextStyle(
                      //     fontFamily: 'Inter',
                      //     fontSize: 13,
                      //     fontWeight: FontWeight.w400,
                      //     color: Color(0xFF898989),
                      //   ),
                      //   textAlign: TextAlign.justify,
                      // ),
                      // const SizedBox(height: 15),
                      // Tips List
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
                      const TipCard(
                        icon: Icons.lightbulb,
                        iconColor: appCream,
                        backgroundColor: creamCardColor,
                        title: 'Tip 06',
                        description:
                            'Power down those electronics: Standby power drain adds up. Turn them off!',
                      ),
                      const TipCard(
                        icon: Icons.thermostat,
                        iconColor: appGreen,
                        backgroundColor: greenCardColor,
                        title: 'Tip 07',
                        description:
                            'Power down those electronics: Standby power drain adds up. Turn them off!',
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar createSilverAppBar1() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: appGreen,
      expandedHeight: 130,
      floating: false,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize().width(context) * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Quick Tips for You',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                  child: SizedBox(
                    width: ScreenSize().width(context),
                    child: const Text(
                      'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text',
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
      automaticallyImplyLeading: false,
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
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // const SizedBox(
          //     height: 50), // Add space between title and search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        defaultShadow(),
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
                        prefixIcon:
                            Icon(Icons.search, size: 16, color: Colors.black),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: FloatingActionButton(
                      key: UniqueKey(),
                      backgroundColor: appCream,
                      onPressed: () {},
                      child: SvgPicture.asset(
                        'assets/icons/sort.svg',
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
