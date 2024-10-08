import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/screens/compare_screen.dart';
import 'package:wattchecker/screens/home_screen.dart';
import 'package:wattchecker/screens/profile_screen.dart';
import 'package:wattchecker/screens/tips_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentIndex = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _navigateToScanScreen(BuildContext context) async {
    setState(() {
      currentScreen = const Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        strokeWidth: 2,
      ));
    });
    await Navigator.pushNamed(context, '/scanScreen').then((_) => setState(() {
          switch (currentIndex) {
            case 0:
              currentScreen = const HomeScreen();
              break;
            case 1:
              currentScreen = const CompareScreen();
              break;
            case 2:
              currentScreen = const TipsScreen();
              break;
            case 3:
              currentScreen = const ProfileScreen();
              break;
            default:
              currentScreen = const HomeScreen();
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: appGreen,
          onPressed: () {
            _navigateToScanScreen(context);
          },
          child: SvgPicture.asset(
            'assets/icons/barcode_btn.svg',
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: bottomNavBarColor,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const HomeScreen();
                          currentIndex = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/home.svg',
                            height: 25,
                            colorFilter: ColorFilter.mode(
                                currentIndex == 0
                                    ? navButtonTrue
                                    : navButtonFalse,
                                BlendMode.srcIn),
                          ),
                          Text('Home',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  color: currentIndex == 0
                                      ? navButtonTrue
                                      : navButtonFalse)),
                        ],
                      ),
                    ),
                    MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const CompareScreen();
                          currentIndex = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/compare.svg',
                            colorFilter: ColorFilter.mode(
                                currentIndex == 1
                                    ? navButtonTrue
                                    : navButtonFalse,
                                BlendMode.srcIn),
                            height: 25,
                          ),
                          Text(
                            'Compare',
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                color: currentIndex == 1
                                    ? navButtonTrue
                                    : navButtonFalse),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
              const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Scan',
                    style: TextStyle(color: navButtonFalse),
                  )),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const TipsScreen();
                          currentIndex = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/tips.svg',
                            colorFilter: ColorFilter.mode(
                                currentIndex == 2
                                    ? navButtonTrue
                                    : navButtonFalse,
                                BlendMode.srcIn),
                            height: 25,
                          ),
                          Text(
                            'Tips',
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                color: currentIndex == 2
                                    ? navButtonTrue
                                    : navButtonFalse),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const ProfileScreen();
                          currentIndex = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/user.svg',
                            colorFilter: ColorFilter.mode(
                                currentIndex == 3
                                    ? navButtonTrue
                                    : navButtonFalse,
                                BlendMode.srcIn),
                            height: 25,
                          ),
                          Text(
                            'You',
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                color: currentIndex == 3
                                    ? navButtonTrue
                                    : navButtonFalse),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
