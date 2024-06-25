import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/styles.dart';
import 'package:wattchecker/models/device_info.dart';

class AnnualEnergyUsageCard extends StatelessWidget {
  final Device? device;
  const AnnualEnergyUsageCard({super.key, this.device});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: greenCardColor,
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            boxShadow: [
              defaultShadow(),
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/icons/energy_usage.svg'),
            
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(device!.powerRatingPerYear.toString(), style: const TextStyle(fontFamily: 'Lexend', fontSize: 24, color: textBlack, fontWeight: FontWeight.w700),),
                    const SizedBox(width: 5,),
                    const Text('kWh/yr', style: TextStyle(fontFamily: 'Lexend', fontSize: 14, color: textGrey,),),

                  ],
                ),
                                  
                const Text('Annual Energy Usage', style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textGrey),)
              ],
            ),
          ),
        ),
    );
  }
}