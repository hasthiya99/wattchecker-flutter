import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/styles.dart';
import 'package:wattchecker/models/device_info.dart';
import 'package:wattchecker/services/shared_prefs.dart';

class EstimatedAnnualCostCard extends StatelessWidget {
  final Device? device;
  const EstimatedAnnualCostCard({super.key, this.device});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: creamCardColor,
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
                SvgPicture.asset('assets/icons/annual_cost.svg'),
            
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    
                    const Text('\$', style: TextStyle(fontFamily: 'Lexend', fontSize: 14, color: textGrey,),),
                    const SizedBox(width: 5,),
                    Text((device!.powerRatingPerYear*SharedPrefs().getDoubleValue('utilityRate')!).toString(), style: const TextStyle(fontFamily: 'Lexend', fontSize: 24, color: textBlack, fontWeight: FontWeight.w700),),
                    
                  ],
                ),
                                  
                const Text('Estimated Annual Cost', style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textGrey),)
              ],
            ),
          ),
        ),
    );
  }
}