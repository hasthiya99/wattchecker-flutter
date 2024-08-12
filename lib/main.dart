import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wattchecker/models/user.dart';
import 'package:wattchecker/screens/forgot_pw_email.dart';
import 'package:wattchecker/screens/forgot_pw_success.dart';
import 'package:wattchecker/screens/gifts_for_you.dart';
import 'package:wattchecker/screens/landing_page.dart';
import 'package:wattchecker/screens/login_screen.dart';
import 'package:wattchecker/screens/profile_screen.dart';
import 'package:wattchecker/screens/quick_tips.dart';
import 'package:wattchecker/screens/scan_barcode.dart';
import 'package:wattchecker/screens/scan_product.dart';
import 'package:wattchecker/screens/setting.dart';
import 'package:wattchecker/screens/signup.dart';
import 'package:wattchecker/screens/signup_success.dart';
import 'package:wattchecker/screens/splash_screen.dart';
import 'package:wattchecker/screens/welcome_screen.dart';
import 'package:wattchecker/services/shared_prefs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefs().init().then((value) => runApp(const MyApp()));
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
      home: const SplashScreen(),
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUp(),
        '/signupSuccess': (context) => const SignupSuccess(),
        '/verifyEmail': (context) => const VerifyEmail(),
        '/resetSuccess': (context) => const PasswordResetSuccess(),
        '/landing': (context) => const LandingPage(),
        '/scanScreen': (context) => const ScanProductScreen(),
        '/scanBarcode': (context) => const ScanBarcode(),
        '/quickTips': (context) => const QuickTipsForYou(),
        '/gifts': (context) => const GiftsForYou(),
        '/SettingsPage': (context) => SettingsPage(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
