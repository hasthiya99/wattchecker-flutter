import 'package:flutter/material.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/device_info.dart';

class DeviceDetailsCard extends StatelessWidget {
  final Device device;
  const DeviceDetailsCard({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize().width(context)*0.8,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.08)
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(device.imageUrl),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: Text(device.deviceName, style: const TextStyle(fontFamily: 'Mulish', fontWeight: FontWeight.bold, fontSize: 14,),)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text('Model number', style: TextStyle(fontFamily: 'Mulish', fontSize: 12),textAlign: TextAlign.start,),),
                      Expanded(
                        flex: 2,
                        child: Text(device.modelNumber.toUpperCase(), style: const TextStyle(fontFamily: 'Mulish', fontWeight: FontWeight.bold, fontSize: 12),textAlign: TextAlign.start))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text('Energy usage', style: TextStyle(fontFamily: 'Mulish', fontSize: 12),textAlign: TextAlign.start,),),
                      Expanded(
                        flex: 2,
                        child: Text('${device.powerRatingPerYear.toString()} kWh/year', style: const TextStyle(fontFamily: 'Mulish', fontWeight: FontWeight.bold, fontSize: 12),textAlign: TextAlign.start))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text('Estimated cost', style: TextStyle(fontFamily: 'Mulish', fontSize: 12),textAlign: TextAlign.start,),),
                      Expanded(
                        flex: 2,
                        child: Text('\$${device.powerRatingPerYear.toString()}', style: const TextStyle(fontFamily: 'Mulish', fontWeight: FontWeight.bold, fontSize: 12),textAlign: TextAlign.start))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}