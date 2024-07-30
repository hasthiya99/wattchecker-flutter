import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/api_response.dart';
import 'package:wattchecker/models/scanned_device.dart';
import 'package:wattchecker/screens/comparison_preview.dart';
import 'package:wattchecker/screens/device_details_screen.dart';
import 'package:wattchecker/services/api.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/buttons.dart';
import 'package:wattchecker/widgets/device_details_card.dart';
import 'package:wattchecker/widgets/snackbar.dart';

class ScanProductScreen extends StatefulWidget {
  const ScanProductScreen({super.key});

  @override
  State<ScanProductScreen> createState() => _ScanProductScreenState();
}

class _ScanProductScreenState extends State<ScanProductScreen> {

  List<ScannedDevice> selectedDevices = [];
  bool selectMode = false;
  bool recentScansLoading = false;
  List<ScannedDevice> scannedDevices = [];
  
  void selectDevice(ScannedDevice device){
    if(!selectedDevices.contains(device)){
      if(selectedDevices.length<3){
        setState(() {
          selectedDevices.add(device);
        });
      }else{
        showSnackBar(context, 'You can only select 3 devices');
      }
    }else{
      setState(() {
        selectedDevices.remove(device);
      });
    }
    if(selectedDevices.isNotEmpty){
      setState(() {
        selectMode = true;
      });
    }else{
      setState(() {
        selectMode = false;
      });
    }
  }

  void getRecentScans() async {
    setState(() {
      recentScansLoading = true;
    });
    ResponseScans response = await Api().getScannedDevices();
    scannedDevices = response.scannedDevices;
    setState(() {
      recentScansLoading = false;
    });
  }

  void scanBarcode() async {
    await Navigator.pushNamed(context, '/scanBarcode').then((_) => getRecentScans());
  }

  @override
  void initState() {
    super.initState();
    getRecentScans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandardAppBar(title: 'Scan Product',),
      floatingActionButton: Visibility(
        visible: (scannedDevices.isNotEmpty && !recentScansLoading),
        child: FloatingActionButton(
          onPressed: (){
            selectMode?
              (selectedDevices.length>=2)?
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => 
                      ComparisonPreview(
                        device_1: selectedDevices[0].device, 
                        device_2: selectedDevices[1].device, 
                        device_3: (selectedDevices.length==3)? selectedDevices[2].device : null,)) )
              : showSnackBar(context, 'Select 2-3 devices to compare')
            : 
              scanBarcode();
          },
          shape: const CircleBorder(),
          backgroundColor: appGreen,
          child: selectMode? SvgPicture.asset('assets/icons/compare.svg', colorFilter: const ColorFilter.mode(appWhite, BlendMode.srcIn)) : SvgPicture.asset('assets/icons/barcode_btn.svg'),
        ),
      ),
      floatingActionButtonLocation: selectMode? FloatingActionButtonLocation.centerDocked :FloatingActionButtonLocation.endDocked,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: recentScansLoading?
        const Center(child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          strokeWidth: 2,
        ))
        : Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context)*0.05,),
        child: 
        (scannedDevices.isEmpty)?
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
                    scanBarcode();
                  }, 
                  text: 'Scan Barcode'
                ),
                const SizedBox(height: 10,)
                
              ],
            ),
          )
        : ListView.builder(
          itemCount: scannedDevices.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // if(index==0) Visibility(
                  //   visible: selectMode,
                  //   child: const Padding(
                  //     padding: EdgeInsets.only(bottom: 20.0),
                  //     child: Text('Select 2-3 product to compare', textAlign: TextAlign.start, style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: textBlack),),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                      if(selectMode) {
                        selectDevice(scannedDevices[index]);
                      } else {
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => DeviceDetailsScreen(device: scannedDevices[index].device)
                          )
                        );
                      }
                    },
                    onLongPress: () => selectDevice(scannedDevices[index]),
                    child: Stack(
                      children: [
                        DeviceDetailsCard(device: scannedDevices[index].device),
                        Visibility(
                          visible: selectedDevices.contains(scannedDevices[index]),
                          child: Positioned(
                            right: 10,
                            bottom: 10,
                            child: SvgPicture.asset('assets/icons/select.svg')
                          ),
                        )
                      ],
                    )
                  ),
                  if(index==scannedDevices.length-1) const SizedBox(height: 100,)
                ],
              ),
            );
          }
        )
      ),
      bottomNavigationBar: Visibility(
        visible: selectMode,
        child: BottomAppBar(
          color: bottomNavBarColor,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: (){
                        //Share devices
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/icons/share.svg', 
                            height: 20, 
                            colorFilter: const ColorFilter.mode(navButtonFalse, BlendMode.srcIn),
                          ),
                          const Text('Share', style: TextStyle(fontFamily: 'Mulish', color: navButtonTrue)),
                        ],
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('Compare', style: TextStyle(color: navButtonTrue),)
                    ),
                    MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: (){
                        //Delete devices
                        setState(() {
                          for(ScannedDevice device in selectedDevices){
                            scannedDevices.remove(device);
                          }
                          if(scannedDevices.isEmpty){
                            selectMode = false;
                          }
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/delete.svg', 
                            colorFilter: const ColorFilter.mode(navButtonFalse, BlendMode.srcIn),
                            height: 25,
                          ),
                          const Text('Delete', style: TextStyle(fontFamily: 'Mulish', color: navButtonTrue),)
                        ],
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}