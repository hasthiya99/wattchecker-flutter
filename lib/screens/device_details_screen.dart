import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/constants/styles.dart';
import 'package:wattchecker/models/device_info.dart';
import 'package:wattchecker/widgets/annual_energy_usgage_card.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/est_annual_cost_card.dart';

class DeviceDetailsScreen extends StatelessWidget {
  final Device device;
  const DeviceDetailsScreen({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StandardAppBar(title: device.deviceName),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context)*0.05),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    boxShadow: [
                      defaultShadow()
                    ],
                    color: Colors.white
                  ),
                  child: Image.asset(device.imageUrl)
                ),
              ),
              const SizedBox(height: 20,),
              const Text('Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text '
                , style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textGrey),),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Model number', style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textGrey),),
                  Text(device.modelNumber.toUpperCase(), style: const TextStyle(fontFamily: 'Inter', fontSize: 14, color: textBlack, fontWeight: FontWeight.bold),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Dash(
                  direction: Axis.horizontal,
                  length: ScreenSize().width(context)*0.9,
                  dashLength: 5,
                  dashColor: textGrey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Brand name', style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textGrey),),
                  Text('${device.manufacturer} ${device.deviceType}', style: const TextStyle(fontFamily: 'Inter', fontSize: 14, color: textBlack, fontWeight: FontWeight.bold),)
                ],
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnnualEnergyUsageCard(device: device),
                  const SizedBox(width: 20,),
                  EstimatedAnnualCostCard(device: device,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}