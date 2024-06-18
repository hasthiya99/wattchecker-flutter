import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/screens/compare_screen.dart';
import 'package:wattchecker/screens/home_screen.dart';
import 'package:wattchecker/screens/profile_screen.dart';
import 'package:wattchecker/screens/scan_screen.dart';
import 'package:wattchecker/screens/tips_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const CompareScreen(),
    const ScanScreen(),
    const TipsScreen(),
    const ProfileScreen()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),

      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: fabButtonColor,
        onPressed: (){
          setState(() {
            currentScreen = const ScanScreen();
            currentIndex = 2;
          });
        },
        child: SvgPicture.asset('assets/icons/barcode.svg',),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: bottomNavBarColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget> [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = const HomeScreen();
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/home.svg', color: currentIndex == 0? navButtonTrue : navButtonFalse ,height: 25,),
                        Text('Home', style: TextStyle(fontFamily: 'Mulish', color: currentIndex==0? navButtonTrue : navButtonFalse)),
                      ],
                    ),
                  ),
                  MaterialButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = const CompareScreen();
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/compare.svg', color: currentIndex == 1? navButtonTrue : navButtonFalse ,height: 25,),
                        Text('Compare', style: TextStyle(fontFamily: 'Mulish', color: currentIndex==1? navButtonTrue : navButtonFalse),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text('Scan', style: TextStyle(color: currentIndex==2? navButtonTrue : navButtonFalse),)),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = const TipsScreen();
                        currentIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/tips.svg', color: currentIndex == 3? navButtonTrue : navButtonFalse , height: 25,),
                        Text('Tips', style: TextStyle(fontFamily: 'Mulish', color: currentIndex==3? navButtonTrue : navButtonFalse),)
                      ],
                    ),
                  ),
                  MaterialButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = const ProfileScreen();
                        currentIndex = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/user.svg', color: currentIndex == 4? navButtonTrue : navButtonFalse ,height: 25,),
                        Text('You', style: TextStyle(fontFamily: 'Mulish', color: currentIndex==4? navButtonTrue : navButtonFalse),)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}