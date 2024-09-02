import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/constants/styles.dart';
import 'package:wattchecker/models/api_response.dart';
import 'package:wattchecker/models/device_info.dart';
import 'package:wattchecker/models/scanned_device.dart';
import 'package:wattchecker/screens/comparison_preview.dart';
import 'package:wattchecker/services/api.dart';
import 'package:wattchecker/widgets/buttons.dart';
import 'package:wattchecker/widgets/device_details_card.dart';
import 'package:wattchecker/widgets/snackbar.dart';

class CompareScreen extends StatefulWidget {
  const CompareScreen({super.key});

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  bool recentScansLoading = true; // Initialize loading state to true
  List<ScannedDevice> scannedDevices = [];
  Device? device1;
  Device? device2;
  Device? device3;

  @override
  void initState() {
    super.initState();
    getRecentScans();
  }

  Future<void> getRecentScans() async {
    setState(() {
      recentScansLoading = true; // Show loading indicator
    });

    try {
      ResponseScans response = await Api().getScannedDevices();
      if (!mounted) return;

      setState(() {
        scannedDevices = response.scannedDevices;
      });
    } catch (e) {
      // Handle error (optional)
    } finally {
      if (mounted) {
        setState(() {
          recentScansLoading = false; // Hide loading indicator
        });
      }
    }
  }

  showDevicesPopup(BuildContext context, int deviceSlot){
    showModalBottomSheet(
      context: context, 
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: ScreenSize().height(context)*0.75,
          child: ListView.builder(
            itemCount: scannedDevices.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    if(deviceSlot==1){
                      setState(() {
                        device1 = scannedDevices[index].device;
                        Navigator.pop(context);
                      });
                    } else if(deviceSlot==2){
                      setState(() {
                        device2 = scannedDevices[index].device;
                        Navigator.pop(context);
                      });
                    } else if(deviceSlot==3){
                      setState(() {
                        device3 = scannedDevices[index].device;
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: DeviceDetailsCard(device: scannedDevices[index].device)
                ),
              );
            },
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Compare Devices',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
            ),
          ),
        ),
        backgroundColor: appGreen,
        centerTitle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: recentScansLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: appGreen,
              ),
            )
          : SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      GestureDetector(
                        onTap: () => showDevicesPopup(context, 1),
                        child: Container(
                          width: ScreenSize().width(context)*0.9,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(14)),
                            boxShadow: [
                              defaultShadow(),
                            ]
                          ),
                          child: (device1!=null)? DeviceDetailsCard(device: device1!) : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_circle, color: appGreen,),
                              Text('Select Device 1', style: TextStyle(fontFamily: 'Mulish', fontWeight: FontWeight.bold, fontSize: 14,),)
                            ],
                          ),
                        ),
                      ),
                      
                      GestureDetector(
                        onTap: () {
                          if(device1==null){
                            showSnackBar(context, 'Select device 1 first!');
                          }else{
                            showDevicesPopup(context, 2);
                          }
                        },
                        child: Container(
                          width: ScreenSize().width(context)*0.9,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(14)),
                            boxShadow: [
                              defaultShadow(),
                            ]
                          ),
                          child: (device2!=null)? DeviceDetailsCard(device: device2!) : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_circle, color: appGreen,),
                              Text('Select Device 2', style: TextStyle(fontFamily: 'Mulish', fontWeight: FontWeight.bold, fontSize: 14,),)
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          if(device1==null){
                            showSnackBar(context, 'Select device 1 first!');
                          } else if(device2==null){
                            showSnackBar(context, 'Select device 2 first!');
                          }else{
                            showDevicesPopup(context, 3);
                          }
                        },
                        child: Container(
                          width: ScreenSize().width(context)*0.9,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(14)),
                            boxShadow: [
                              defaultShadow(),
                            ]
                          ),
                          child: (device3!=null)? DeviceDetailsCard(device: device3!) : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_circle, color: appGreen,),
                              Text('Select Device 3', style: TextStyle(fontFamily: 'Mulish', fontWeight: FontWeight.bold, fontSize: 14,),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context)*0.05),
                    child: ButtonLong(
                      onPressed: (){
                        if(device2!=null){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ComparisonPreview(device_1: device1!, device_2: device2!, device_3: device3,)));
                        } else {
                          showSnackBar(context, 'Please select at least 2 devices');
                        }
                      }, 
                      text: 'Compare',),
                  )
                ),
                const SizedBox(height: 50,)
              ],
            ),
          ),
    );
  }
}
