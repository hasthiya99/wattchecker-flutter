import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';

class ButtonLong extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const ButtonLong({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: onPressed, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(appGreen),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              minimumSize: MaterialStateProperty.all(Size(ScreenSize().width(context)*0.8, 50))
            ),
            child: Text(text, style: const TextStyle(fontFamily: 'Inter', fontSize: 16, color: appWhite, fontWeight: FontWeight.bold),),
          );
  }
}