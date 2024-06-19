
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double fontSize = 34;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context)*0.1, vertical: ScreenSize().height(context)*0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Save money', 
                    style: TextStyle(fontFamily: 'Lexend', color: appGreen, fontSize: fontSize, fontWeight: FontWeight.w800),
                    textAlign: TextAlign.center,
                    ),
                  Text(
                    '& energy with', 
                    style: TextStyle(fontFamily: 'Lexend', color: appGreen, fontSize: fontSize, fontWeight: FontWeight.w800),
                    textAlign: TextAlign.center,
                    ),
                  Text(
                    'WattChecker', 
                    style: TextStyle(fontFamily: 'Lexend', color: appCream, fontSize: fontSize, fontWeight: FontWeight.w800), 
                    textAlign: TextAlign.center,
                    ),
                ],
              ),

              SvgPicture.asset('assets/images/welcome_image.svg'),

              const Text(
                'Get an overview of your recent scans, quick tips, and shortcuts to save energy.', 
                style: TextStyle(fontFamily: 'Lexend', fontSize: 16, color: textBlack,),
                textAlign: TextAlign.center,
              ),
              
              ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/landing');
                    }, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(appGreen),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      minimumSize: MaterialStateProperty.all(Size(ScreenSize().width(context)*0.8, 50))
                    ),
                    child: const Text('Continue', style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: appWhite, fontWeight: FontWeight.bold),),
                  )
            ],
          ),
        ),
      ),
    );
  }
}