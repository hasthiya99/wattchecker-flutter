import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/buttons.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandardAppBar(title: 'Scan Product',),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context)*0.05,),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text',
                style: TextStyle(fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10,),
              SvgPicture.asset('assets/images/barcode.svg', height: 290,),
              const SizedBox(height: 10,),
              ButtonLong(
                onPressed: (){
                  Navigator.pushNamed(context, '/scanBarcode');
                }, 
                text: 'Scan Barcode'
              ),
              const SizedBox(height: 10,)
              
            ],
          ),
        ),
      ),
    );
  }
}