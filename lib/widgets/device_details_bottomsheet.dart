import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/dummy_data.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/device_info.dart';
import 'package:wattchecker/widgets/annual_energy_usgage_card.dart';
import 'package:wattchecker/widgets/buttons.dart';
import 'package:wattchecker/widgets/est_annual_cost_card.dart';

class DeviceDetailsBottomsheet extends StatefulWidget {
  final String productId; 
  const DeviceDetailsBottomsheet({super.key, required this.productId});

  @override
  State<DeviceDetailsBottomsheet> createState() => _DeviceDetailsBottomsheetState();
}

class _DeviceDetailsBottomsheetState extends State<DeviceDetailsBottomsheet> {

  late Device? device;

  Device? checkProduct(){
    for (Device device in database){
      if(device.modelNumber == widget.productId.toLowerCase()){
        return device;
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    device = checkProduct();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 150,
              maxHeight: constraints.maxHeight * 0.8,
            ),
            child: IntrinsicHeight(
              child: SizedBox(
                width: ScreenSize().width(context),
                child: device == null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 50),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/images/no_device.svg', height: 100,),
                                  const SizedBox(height: 40,),
                                  const Text('Product not found', style: TextStyle(fontFamily: 'Mulish', fontSize: 14, fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10,),
                                  const Text('We couldn\'t find that product in our database', style: TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textGrey),),
                                  const SizedBox(height: 40,),
                                ],
                              ),
                            ),
                            ButtonLong(
                                  onPressed: (){
                                    //User should be able to add a new device to the database
                                  }, 
                                  text: 'Add Product')
                          ],
                        ),
                      )
                    : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      child: Column(
                        children: [
                          Image.asset(device!.imageUrl, height: 200,),
                          const SizedBox(height: 20,),
                          Text(device!.deviceName, style: const TextStyle(fontFamily: 'Inter', fontSize: 12, color: textGrey),),
                          const SizedBox(height: 40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Model number', style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textGrey),),
                              Text(device!.modelNumber.toUpperCase(), style: const TextStyle(fontFamily: 'Inter', fontSize: 14, color: textBlack, fontWeight: FontWeight.bold),)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Dash(
                              direction: Axis.horizontal,
                              length: ScreenSize().width(context)-80,
                              dashLength: 5,
                              dashColor: textGrey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Brand name', style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textGrey),),
                              Text('${device!.manufacturer} ${device!.deviceType}', style: const TextStyle(fontFamily: 'Inter', fontSize: 14, color: textBlack, fontWeight: FontWeight.bold),)
                            ],
                          ),
                          const SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AnnualEnergyUsageCard(device: device),
                              const SizedBox(width: 20,),
                              EstimatedAnnualCostCard(device: device,)
                            ],
                          ),
                          const SizedBox(height: 40,),
                          ButtonLong(
                            onPressed: (){
                              //User should be able to save the device to the account
                              if(!deviceList.contains(device)) {
                                setState(() {
                                  deviceList.add(device!);
                                });
                              }
                              Navigator.pop(context);
                            }, 
                            text: 'Save Device'
                          )
                        ],
                      ),
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
