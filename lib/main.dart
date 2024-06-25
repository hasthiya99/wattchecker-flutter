import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wattchecker/screens/landing_page.dart';
import 'package:wattchecker/screens/scan_barcode.dart';
import 'package:wattchecker/screens/scan_product.dart';
import 'package:wattchecker/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
      routes: {
        '/landing' : (context) =>  const LandingPage(),
        '/scanScreen' : (context) =>  const ScanProductScreen(),
        '/scanBarcode' : (context) =>  const ScanBarcode(),
      },
    );
  }
}
