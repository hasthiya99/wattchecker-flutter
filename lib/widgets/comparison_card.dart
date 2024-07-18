import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/models/device_info.dart';
import 'package:wattchecker/widgets/annual_energy_usgage_card.dart';
import 'package:wattchecker/widgets/est_annual_cost_card.dart';

class ComparisonCard extends StatelessWidget {
  final Device device;
  const ComparisonCard({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.network(device.imageUrl,)
              ),
              const SizedBox(width: 10,),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Model number', style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textGrey),),
                          Text(device.modelNumber.toUpperCase(), style: const TextStyle(fontFamily: 'Inter', fontSize: 14, color: textBlack, fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Brand name', style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textGrey),),
                          Text('${device.manufacturer} ${device.deviceType}', style: const TextStyle(fontFamily: 'Inter', fontSize: 14, color: textBlack, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        
      
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnnualEnergyUsageCard(device: device),
              const SizedBox(width: 20,),
              EstimatedAnnualCostCard(device: device,)
            ],
          ),
        ),
        const SizedBox(height: 40,),
      ],
    );
  }
}