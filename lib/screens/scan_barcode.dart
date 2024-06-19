import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/buttons.dart';

class ScanBarcode extends StatefulWidget {
  const ScanBarcode({super.key});

  @override
  State<ScanBarcode> createState() => _ScanBarcodeState();
}

class _ScanBarcodeState extends State<ScanBarcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StandardAppBar(title: 'Scan Barcode'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context)*0.05,),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: ScreenSize().width(context)*0.7,
                child: const Text(
                  'Hold your phone steady and focus on the barcode',
                  style: TextStyle(fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),

              SvgPicture.asset('assets/images/barcode.svg', height: 290,),
              
              ButtonLong(
                onPressed: (){
                  Navigator.pushNamed(context, '/scanBarcode');
                }, 
                text: 'Scan Barcode'
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}