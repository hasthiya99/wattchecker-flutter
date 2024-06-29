import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/dummy_data.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/buttons.dart';
import 'package:wattchecker/widgets/device_details_card.dart';

class ScanProductScreen extends StatefulWidget {
  const ScanProductScreen({super.key});

  @override
  State<ScanProductScreen> createState() => _ScanProductScreenState();
}

class _ScanProductScreenState extends State<ScanProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandardAppBar(title: 'Scan Product',),
      floatingActionButton: Visibility(
        visible: (deviceList.isNotEmpty),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, '/scanBarcode').then((value) => setState(() {}));
          },
          shape: const CircleBorder(),
          backgroundColor: fabButtonColor,
          child: SvgPicture.asset('assets/icons/barcode_btn.svg'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context)*0.05,),
        child: 
        (deviceList.isEmpty)?
          Center(
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
                    Navigator.pushNamed(context, '/scanBarcode').then((value) => setState(() {}));
                  }, 
                  text: 'Scan Barcode'
                ),
                const SizedBox(height: 10,)
                
              ],
            ),
          )
        : ListView.builder(
          itemCount: deviceList.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: DeviceDetailsCard(device: deviceList[index]),
            );
          }
        )
      ),
    );
  }
}