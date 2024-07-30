import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/api_response.dart';
import 'package:wattchecker/models/device_info.dart';
import 'package:wattchecker/models/scanned_device.dart';
import 'package:wattchecker/screens/add_device.dart';
import 'package:wattchecker/screens/device_details_screen.dart';
import 'package:wattchecker/services/api.dart';
import 'package:wattchecker/widgets/annual_energy_usgage_card.dart';
import 'package:wattchecker/widgets/buttons.dart';
import 'package:wattchecker/widgets/est_annual_cost_card.dart';
import 'package:wattchecker/widgets/snackbar.dart';

class DeviceDetailsBottomsheet extends StatefulWidget {
  final String productId; 
  const DeviceDetailsBottomsheet({super.key, required this.productId});

  @override
  State<DeviceDetailsBottomsheet> createState() => _DeviceDetailsBottomsheetState();
}

class _DeviceDetailsBottomsheetState extends State<DeviceDetailsBottomsheet> {
  bool isLoading = true;
  bool saveBtnLoading = false;
  late ResponseDevice responseDevice;

  checkProduct() async {
    setState(() {
      isLoading = true;
    });
    ResponseDevice response = await Api().getDevice(widget.productId);
    setState(() {
      responseDevice = response;
      isLoading = false;
    });
  }


  bool isDeviceInList(List<ScannedDevice> list, Device device) {
    for (var scannedDevice in list) {
      if (scannedDevice.device == device) {
        return true;
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    checkProduct();
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
                child: isLoading ? const Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                strokeWidth: 2,
                              ),
                            ) 
                      : responseDevice.success == true ?
                          Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                          child: Column(
                            children: [
                              Image.network(
                                responseDevice.device.imageUrl, 
                                height: 200,
                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        height: 200,
                                        width: 200,
                                        color: Colors.white,
                                      ),
                                    );
                                  }
                                },
                              ),
                              const SizedBox(height: 20,),
                              Text(responseDevice.device.deviceName, style: const TextStyle(fontFamily: 'Inter', fontSize: 12, color: textGrey),),
                              const SizedBox(height: 40,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Model number', style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textGrey),),
                                  Text(responseDevice.device.modelNumber.toUpperCase(), style: const TextStyle(fontFamily: 'Inter', fontSize: 14, color: textBlack, fontWeight: FontWeight.bold),)
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
                                  Text('${responseDevice.device.manufacturer} ${responseDevice.device.deviceType}', style: const TextStyle(fontFamily: 'Inter', fontSize: 14, color: textBlack, fontWeight: FontWeight.bold),)
                                ],
                              ),
                              const SizedBox(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AnnualEnergyUsageCard(device: responseDevice.device),
                                  const SizedBox(width: 20,),
                                  EstimatedAnnualCostCard(device: responseDevice.device,)
                                ],
                              ),
                              const SizedBox(height: 40,),
                              ButtonLong(
                                isLoading: saveBtnLoading,
                                onPressed: () async{
                                  setState(() {
                                    saveBtnLoading = true;
                                  });

                                  ResponseMessage response = await Api().addDeviceToAccount(responseDevice.device.productId);
                                  if(!mounted) return;
                                  if(context.mounted){
                                    if (response.success){
                                      showSnackBar(context, 'Device saved successfully');
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DeviceDetailsScreen(device:responseDevice.device)));
                                    } else {
                                      Navigator.pop(context);
                                      showSnackBar(context, 'Failed to save device');
                                    }
                                  }
                                  setState(() {
                                    saveBtnLoading = false;
                                  },);
                                  // Navigator.pop(context);
                                  
                                }, 
                                text: 'Save Device',
                              )
                            ],
                          ),
                        )
                      :
                        responseDevice.message == 404 ? 
                                Padding(
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
                                      SizedBox(
                                        width: ScreenSize().width(context)*0.8,
                                        child: ButtonLong(
                                              onPressed: (){
                                                Navigator.push(
                                                  context, 
                                                  MaterialPageRoute(
                                                    builder: (context) => AddDevice(modelNumber: widget.productId,)
                                                    )
                                                  ).then((_) {
                                                    checkProduct();
                                                    setState(() {
                                                      
                                                    });
                                                  });
                                              }, 
                                              text: 'Add Product',
                                            ),
                                      )
                                    ],
                                  ),
                                )
                        :
                          const Center(child: Text('An error occured. Please try again later', style: TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textGrey)),)
                        
              ),
            ),
          );
        },
      ),
    );
  }
}
