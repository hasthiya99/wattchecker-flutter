import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/services/api.dart';
import 'package:wattchecker/services/shared_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late bool? isLoggedIn;
  bool validToken =false;
  bool loading = true;

  @override
  void initState(){
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
  isLoggedIn = SharedPrefs().getBoolValue('isLoggedIn');
  if (isLoggedIn == true) {
    validToken = await Api().checkToken();
  }
  if (context.mounted) {
    if (validToken) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushNamedAndRemoveUntil(context, '/landing', (route) => false);
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, '/welcome');
      });
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, '/welcome'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              SizedBox(
                height: 30,
                width: 30,
                child: Visibility(
                  visible: loading,
                  child: const CircularProgressIndicator(color: appBlack,)),
              )
            ],
          )
        )
      )
    );
  }
}