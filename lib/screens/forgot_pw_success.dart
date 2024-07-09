import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/widgets/buttons.dart';

class PasswordResetSuccess extends StatelessWidget {
  const PasswordResetSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context)*0.05),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/success_circle.svg'),
              const SizedBox(height: 20,),
              const Text('Password Changed!', style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: textBlack, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              const Text('Your password has been changed successfully.', style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textGrey)),
              const SizedBox(height: 50,),
              ButtonLong(
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                }, 
                text: 'Login')
            ],
          ),
        ),
      ),
    );
  }
}